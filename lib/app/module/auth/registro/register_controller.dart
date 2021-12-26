import 'package:agenda_fechada/app/auth_exception/auth_exception.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;

  String? error;
  bool success = false;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();
      final user = await _userService.register(email, password);

      if (user != null) {
        success = true;
      } else {
        error = 'erro ao registrar usuario';
      }
    } on AuthException catch (e) {
      error = e.menssage;
    } finally {
      notifyListeners();
    }
  }
}
