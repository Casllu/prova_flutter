import 'package:prova_flutter/app/repositories/login/login_repository_impl.dart';
import '../models/user_model.dart';

class LoginController {
  LoginRepositoryImpl? _loginRepository;

  LoginController() {
    _loginRepository = LoginRepositoryImpl();
  }

  Future<List<UserModel>> login() async {
    var listUser = await _loginRepository!.login();

    return listUser;
  }
}
