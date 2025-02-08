import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  TextEditingController fullNameController =
      TextEditingController(text: "Marwan reda");
  TextEditingController mobileNumberController =
      TextEditingController(text: "01012345678");
  TextEditingController emailController =
      TextEditingController(text: "Maadasd@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Marwan@2002");
  TextEditingController rePasswordController =
      TextEditingController(text: "Marwan@2002");
  var formKey = GlobalKey<FormState>();

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          mobileNumberController.text);
      either.fold(
          (error) => emit(RegisterErrorState(errors: error)),
          (response) =>
              emit(RegisterSuccessState(registerResponseEntity: response)));
    }
  }
}
