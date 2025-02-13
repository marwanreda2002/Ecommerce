import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategorySuccessState extends HomeTabStates {
  CategoriesOrBrandsResponseEntity categoriesResponseEntity;

  CategorySuccessState({required this.categoriesResponseEntity});
}
class CategoryErrorState extends HomeTabStates {
  String errMsg;

  CategoryErrorState({required this.errMsg});
}

class BrandsLoadingState extends HomeTabStates {}

class BrandsSuccessState extends HomeTabStates {
  CategoriesOrBrandsResponseEntity brandsResponseEntity;

  BrandsSuccessState({required this.brandsResponseEntity});
}

class BrandsErrorState extends HomeTabStates {
  String errMsg;

  BrandsErrorState({required this.errMsg});
}
