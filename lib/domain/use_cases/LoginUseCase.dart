import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failuer.dart';
import '../entites/LoginResponseEntity.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failures, LoginResponseEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
