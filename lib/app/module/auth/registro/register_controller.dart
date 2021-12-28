import 'package:agenda_fechada/app/auth_exception/auth_exception.dart';
import 'package:agenda_fechada/app/core/database/notifier/default_changer_notifier.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:flutter/material.dart';

class RegisterController extends DefaultChangerNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndREsetState();

      notifyListeners();
      final user = await _userService.register(email, password);

      if (user != null) {
        success();
      } else {
        setError('erro ao registrar usuario');
      }
    } on AuthException catch (e) {
      setError(e.menssage);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
