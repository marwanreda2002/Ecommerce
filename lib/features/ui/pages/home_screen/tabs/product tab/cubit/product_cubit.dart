import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/product%20tab/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductStates> {
  ProductCubit({required this.getAllProductsUseCase})
      : super(ProductLoadingState());
  GetAllProductsUseCase getAllProductsUseCase;

  void getAllProduct() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) => emit(ProductErrorState(error.errMsg)),
        (response) => emit(ProductSuccessState(response)));
  }
}
