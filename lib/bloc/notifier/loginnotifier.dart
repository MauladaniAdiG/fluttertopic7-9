import 'package:app/bloc/repository/loginrepo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInit extends LoginState {
  const LoginInit();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginComplete extends LoginState {
  const LoginComplete();
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginRepo _loginRepo;
  LoginNotifier(this._loginRepo) : super(LoginInit());

  Future storeData(String email, String password) async {
    try {
      state = LoginLoading();
      await _loginRepo.storeData(email, password);
      state = LoginComplete();
    } catch (e) {
      state = LoginError(e.toString());
    }
  }
}
