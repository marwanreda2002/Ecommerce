import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../entites/CategoriesResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoriesResponseEntity>> getAllCategories();
}
