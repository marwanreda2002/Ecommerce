import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../domain/entites/CategoriesResponseEntity.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());
  List<CategoriesOrBrandsEntity> categoriesList = [];
  List<CategoriesOrBrandsEntity> brandsList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoryErrorState(errMsg: error.errMsg));
      },
      (response) {
        categoriesList = response.data!;
        emit(CategorySuccessState(categoriesResponseEntity: response));
      },
    );
  }

  void getAllBrands() async {
    emit(BrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        emit(BrandsErrorState(errMsg: error.errMsg));
      },
      (response) {
        brandsList = response.data!;

        emit(BrandsSuccessState(brandsResponseEntity: response));
      },
    );
  }
}
