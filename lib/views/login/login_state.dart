// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  bool _obscurePassword = true;

  @observable
  bool _loggingIn = false;

  @observable
  bool _lembrarSe = false;

  @observable
  String _errorMessage = '';

  @computed
  bool get obscurePassword => _obscurePassword;

  @computed
  bool get loggingIn => _loggingIn;

  @computed
  bool get lembrarSe => _lembrarSe;

  @computed
  String get errorMessage => _errorMessage;

  @action
  void changeObscurePassword() {
    _obscurePassword = !_obscurePassword;
  }

  @action
  void setLogginIn({required bool value}) {
    _loggingIn = value;

    if (value) {
      _errorMessage = '';
    }
  }

  @action
  void setLembrarSe({required bool value}) {
    _lembrarSe = value;
  }

  @action
  void setErrorMessage(String message) {
    _errorMessage = message;
  }

  @action
  void resetState() {
    _obscurePassword = true;
    _loggingIn = false;
    _lembrarSe = false;
    _errorMessage = '';
  }
}
