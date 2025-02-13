import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';

import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/data/model/CategoryReponseDm.dart';

import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../domain/repositories/data_sources/remote_data_source/home_remote_data-source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager = ApiManager();

  @override
  Future<Either<Failures, CategoryResponseDm>> getAllCategories() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.getAllCategoryEndPoint);
        var categoryResponse = CategoryResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return Right(categoryResponse);
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
