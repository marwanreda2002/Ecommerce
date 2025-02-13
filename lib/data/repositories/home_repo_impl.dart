import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failuer.dart';

import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_sources/remote_data_source/home_remote_data-source.dart';
import '../../domain/repositories/home/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoriesResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
