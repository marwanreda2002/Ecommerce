import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/data/model/RegisterResponseDM.dart';
import 'package:e_commerce/domain/entites/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, RegisterResponseDM>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager
            .postData(endPoint: EndPoints.registerEndPoint, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        });
        var registerResponse = RegisterResponseDM.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errMsg: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errMsg: "no internet connection"));
      }
    } catch (e) {
      return Left(ServerError(errMsg: e.toString()));
    }
  }
}
