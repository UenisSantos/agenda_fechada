import 'package:agenda_fechada/app/core/navigator/navigator_no_context.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  AuthProvider(
      {required FirebaseAuth firebaseAuth, required UserService userService})
      : _firebaseAuth = firebaseAuth,
        _userService = userService;

  Future<void> logout() => _userService.logout();
  User? get user => _firebaseAuth.currentUser;

  void loadLisener() {
    _firebaseAuth.userChanges().listen((_) => notifyListeners());
    _firebaseAuth.idTokenChanges().listen((user) {
      if (user != null) {
           NavigatorNoContext .to!
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        NavigatorNoContext .to!
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}
