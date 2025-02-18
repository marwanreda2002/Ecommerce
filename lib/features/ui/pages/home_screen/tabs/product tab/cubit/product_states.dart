import '../../../../../../../domain/entites/ProductResponseEntity.dart';

abstract class ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {
  ProductResponseEntity response;

  ProductSuccessState(this.response);
}

class ProductErrorState extends ProductStates {
  String message;

  ProductErrorState(this.message);
}
