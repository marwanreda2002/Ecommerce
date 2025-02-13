import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/domain/entites/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entites/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
