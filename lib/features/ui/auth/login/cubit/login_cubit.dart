import 'package:e_commerce/domain/use_cases/LoginUseCase.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitializeState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) => emit(LoginErrorState(error.errMsg)),
          (response) => emit(LoginSuccessState(response.message!)));
    }
  }
}
