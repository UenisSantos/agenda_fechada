import 'package:agenda_fechada/app/auth_exception/auth_exception.dart';
import 'package:agenda_fechada/app/core/database/notifier/default_changer_notifier.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:agenda_fechada/app/ui/messages.dart';

class LoginControlller extends DefaultChangerNotifier {
  final UserService _userService;
  String? infoMessage;
  LoginControlller({required UserService userService})
      : _userService = userService;
  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndREsetState();

      infoMessage = null;
      notifyListeners();
      final user = await _userService.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('erro ao logar usuario');
      }
    } on AuthException catch (e) {
      setError(e.menssage);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  void recoverPassword(String email) async {
    try {
      showLoadingAndREsetState();
      infoMessage = null;
      await _userService.recoverPassword(email);
      infoMessage = 'reset da senha enviado para o e-mail';
    } catch (e) {
      setError('erro ao resetar senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
