import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_products_states.dart';

class DeleteProductsCubit extends Cubit<DeleteProductsStates> {
  DeleteProductsCubit() : super(DeleteProductsInitialState());

  void deleteProduct(int id) async {
    emit(DeleteProductsLoadingState());
    try {
      final ProductService productService = ProductService();
      await productService.deleteProduct(id);
      emit(DeleteProductsSuccessState());
    } catch (e) {
      emit(DeleteProductsErrorState());
    }
  }
}
