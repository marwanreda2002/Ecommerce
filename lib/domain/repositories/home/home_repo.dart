import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';

import '../../entites/CategoriesResponseEntity.dart';

abstract class HomeRepo {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands();
}
