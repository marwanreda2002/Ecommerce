import 'package:e_commerce/domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../domain/entites/CategoriesResponseEntity.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoriesUseCase;

  HomeTabCubit({required this.getAllCategoriesUseCase})
      : super(CategoryLoadingState());
  List<CategoryEntity> categoriesList = [];

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
}
