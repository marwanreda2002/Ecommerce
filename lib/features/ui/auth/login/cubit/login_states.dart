abstract class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginInitializeState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errMsg;

  LoginErrorState(this.errMsg);
}

class LoginSuccessState extends LoginStates {
  String msg;

  LoginSuccessState(this.msg);
}
