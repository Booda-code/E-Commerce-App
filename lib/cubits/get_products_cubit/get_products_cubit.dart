import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_products_states.dart';

class GetProductsCubit extends Cubit<GetProductsStates> {
  GetProductsCubit() : super(GetProductsSuccessState([]));

  List<ProductModel> products = [];

  getProducts() async {
    emit(GetProductsLoadingState());
    try {
      products = await ProductService().getProducts();
      emit(GetProductsSuccessState(products));
    } catch (e) {
      emit(GetProductsErrorState());
    }
  }
}