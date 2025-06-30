import 'package:ecommerce_app/cubits/post_products_cubit/post_products_states.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostProductsCubit extends Cubit<PostProductsStates> {
  PostProductsCubit() : super(PostProductsLoadingState());

  void postProduct(ProductModel product) async {
    emit(PostProductsLoadingState());
    try {
      final ProductService productService = ProductService();
      await productService.postProduct(product);
      emit(PostProductsSuccessState());
    } catch (e) {
      emit(PostProductsErrorState());
    }
  }
}