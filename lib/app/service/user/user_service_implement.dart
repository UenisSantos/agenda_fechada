import 'package:agenda_fechada/app/repository/use/user.repository.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImplement implements UserService {
  final UserRepository _userRepository;

  UserServiceImplement({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> recoverPassword(String email) =>
      _userRepository.recoverPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();

  @override
  Future<void> logout() => _userRepository.logout();

}
