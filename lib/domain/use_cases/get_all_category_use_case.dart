import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failuer.dart';
import '../entites/CategoriesResponseEntity.dart';

@injectable
class GetAllCategoryUseCase {
  HomeRepo homeRepo;

  GetAllCategoryUseCase({required this.homeRepo});

  Future<Either<Failures, CategoriesResponseEntity>> invoke() {
    return homeRepo.getAllCategories();
  }
}
