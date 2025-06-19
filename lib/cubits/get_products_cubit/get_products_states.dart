import 'package:ecommerce_app/models/product_model.dart';

class GetProductsStates {}

class GetProductsInitialState extends GetProductsStates {}

class GetProductsLoadingState extends GetProductsStates {}

class GetProductsSuccessState extends GetProductsStates {
  final List<ProductModel> products;
  GetProductsSuccessState(this.products);
}

class GetProductsErrorState extends GetProductsStates {}