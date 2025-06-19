import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_products_states.dart';

class GetProductsCubit extends Cubit<GetProductsStates> {
  GetProductsCubit() : super(GetProductsSuccessState([]));

  List<ProductModel> products = [];

  getProducts({required String productName}) async {
    emit(GetProductsLoadingState());
    try {
      final data = await ApiService(Dio()).getProducts(endpoint: productName);
      products = (data as List).map((e) => ProductModel.fromJson(e)).toList();
      emit(GetProductsSuccessState(products));
    } catch (e) {
      emit(GetProductsErrorState());
    }
  }

  void deleteProduct(int id) {
    products.removeWhere((product) => product.id == id);
    emit(GetProductsSuccessState(List.from(products)));
  }

  void postProduct(ProductModel product) {
    products.add(product);
    emit(GetProductsSuccessState(List.from(products)));
  }
}
