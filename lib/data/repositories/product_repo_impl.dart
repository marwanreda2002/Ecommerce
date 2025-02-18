import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/domain/entites/ProductResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart';
import 'package:e_commerce/domain/repositories/products/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await productRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
