import 'package:e_commerce/domain/entites/CategoriesResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategorySuccessState extends HomeTabStates {
  CategoriesResponseEntity categoriesResponseEntity;

  CategorySuccessState({required this.categoriesResponseEntity});
}

class CategoryErrorState extends HomeTabStates {
  String errMsg;

  CategoryErrorState({required this.errMsg});
}
