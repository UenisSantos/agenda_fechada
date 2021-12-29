import 'package:agenda_fechada/app/auth_exception/auth_exception.dart';
import 'package:agenda_fechada/app/ui/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:agenda_fechada/app/repository/use/user.repository.dart';
import 'package:flutter/services.dart';

class UserRepositoryImplement implements UserRepository {
  FirebaseAuth _firebaseAuth;
  UserRepositoryImplement({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        final loginType = await _firebaseAuth.fetchSignInMethodsForEmail(email);

        if (loginType.contains('password')) {
          throw AuthException(
              menssage:
                  'email ja esta sendo utilizado,favor escolher outro email');
        } else {
          throw AuthException(
              menssage: 'da ultima vez você ultizou o google pra fazer login');
        }
      } else {
        throw AuthException(menssage: e.message ?? 'erro ao cadastrar usuario');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e) {
      throw AuthException(menssage: e.message ?? 'erro ao realizar o login');
    } on FirebaseAuthException catch (e) {
      throw AuthException(menssage: e.message ?? 'descupe algo deu errado');
    }
  }

  @override
  Future<void> recoverPassword(String email) async {
    // TODO: implement recoverPassword
    try {
      final loginRecover =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);
      if (loginRecover.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else {
        throw AuthException(
            menssage:
                'seu cadastro foi feito pelo login do google ,não pode resetar senha');
      }
    } on PlatformException catch (e) {
      throw AuthException(menssage: e.message ?? 'erro ao resetar senha');
    }
  }

}
