
import 'package:magdsoft/data/models/account_model.dart';
import 'package:magdsoft/data/network/responses/login_response.dart';

abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}

class AuthenticationCreateAccountLoadingState extends AuthenticationStates {}

class AuthenticationCreateAccountSuccessState extends AuthenticationStates {
  LoginResponse? loginResponse;

  AuthenticationCreateAccountSuccessState({required this.loginResponse});
}

class AuthenticationCreateAccountErrorState extends AuthenticationStates {
  final String message;

  AuthenticationCreateAccountErrorState(this.message);
}

class AuthenticationVerifyPhoneLoadingState extends AuthenticationStates {}

class AuthenticationVerifyPhoneSuccessState extends AuthenticationStates {
  Account? account;

  AuthenticationVerifyPhoneSuccessState({required this.account});
}

class AuthenticationVerifyPhoneErrorState extends AuthenticationStates {
  final String message;

  AuthenticationVerifyPhoneErrorState(this.message);
}

class ShopChangePasswordVisibilityState extends AuthenticationStates {}
