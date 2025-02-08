import 'package:e_commerce/core/errors/failuer.dart';

import '../../../../../domain/entites/RegisterResponseEntity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  Failures errors;

  RegisterErrorState({required this.errors});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}
