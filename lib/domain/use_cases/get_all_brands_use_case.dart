import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failuer.dart';
import '../entites/CategoriesResponseEntity.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepo homeRepo;

  GetAllBrandsUseCase({required this.homeRepo});

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> invoke() {
    return homeRepo.getAllBrands();
  }
}
