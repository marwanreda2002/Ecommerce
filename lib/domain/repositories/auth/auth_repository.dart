import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/RegisterResponseEntity.dart';

import '../../../core/errors/failuer.dart';
import '../../entites/LoginResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
