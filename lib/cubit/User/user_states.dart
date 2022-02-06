
import 'package:itimaaty/Models/ForgotPasswordResponseModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';

abstract class UserStates {}

class LoginInitialState extends UserStates {}

class LoginLoadingState extends UserStates {}

class LoginSuccessState extends UserStates {
  final LoginResponseModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends UserStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginPasswordVisibilityState extends UserStates {}

// ______________________________________

class ForgotPasswordLoadingState extends UserStates {}

class ForgotPasswordSuccessState extends UserStates {
  final ForgotPasswordResponseModel forgotPasswordResponseModel;

  ForgotPasswordSuccessState(this.forgotPasswordResponseModel);
}

class ForgotPasswordErrorState extends UserStates {
  final String error;
  ForgotPasswordErrorState(this.error);
}

// ______________________________________

