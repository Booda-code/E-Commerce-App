import 'package:ecommerce_app/cubits/update_products_cubit/update_products_states.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsStates>{
  UpdateProductsCubit() : super((UpdateProductsInitialState()));

  void updateProduct(ProductModel product) async{
    emit(UpdateProductsLoadingState());
    try{
      final productService = ProductService();
      await productService.updateProduct(product);
      emit(UpdateProductsSuccessState());
    }
        catch (e){
      emit(UpdateProductsErrorState());
        }
  }
}