import 'package:agenda_fechada/app/auth_exception/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:agenda_fechada/app/repository/use/user.repository.dart';

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
          throw AuthException(menssage: 'email ja esta sendo utilizado,favor escolher outro email');
        } else {
          throw AuthException(
              menssage: 'da ultima vez você ultizou o google pra fazer login');
        }
      } else {
        throw AuthException(menssage: e.message ?? 'erro ao cadastrar usuario');
      }
    }
  }
}
