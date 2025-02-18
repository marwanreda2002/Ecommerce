import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/data/model/ProductsResponseDm.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductsResponseDm>> getAllProducts() async {
    try {
      final List<ConnectivityResult> results =
          await Connectivity().checkConnectivity();
      if (results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.getAllProductsEndPoint);
        var productResponse = ProductsResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errMsg: "something went wrong"));
        }
      } else {
        return Left(NetworkError(errMsg: "no internet connection"));
      }
    } catch (e) {
      return Left(Failures(errMsg: e.toString()));
    }
  }
}
