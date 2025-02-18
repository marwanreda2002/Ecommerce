import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../entites/ProductResponseEntity.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
}
