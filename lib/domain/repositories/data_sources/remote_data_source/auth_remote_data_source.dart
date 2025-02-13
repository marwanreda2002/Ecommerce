import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/domain/entites/LoginResponseEntity.dart';

import '../../../entites/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
