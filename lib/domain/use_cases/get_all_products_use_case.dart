import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failuer.dart';
import '../entites/ProductResponseEntity.dart';
import '../repositories/products/product_repo.dart';

@injectable
class GetAllProductsUseCase {
  final ProductRepo productRepo;

  GetAllProductsUseCase(this.productRepo);

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productRepo.getAllProducts();
  }
}
