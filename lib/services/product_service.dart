import 'package:dio/dio.dart';
import 'package:ecommerce_app/services/api_service.dart';
import '../models/product_model.dart';

class ProductService {
  final ApiService apiService = ApiService(Dio());

  Future<List<ProductModel>> getProducts() async {
    try {
      final data = await apiService.get('products');
      if (data is List) {
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> postProduct(ProductModel product) async {
    try {
      await apiService.post('products', product.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await apiService.put('products/${product.id}', product.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await apiService.delete('products/$id');
    } catch (e) {
      rethrow;
    }
  }
}
