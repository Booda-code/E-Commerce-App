import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductService {
  final String baseUrl = 'https://fakestoreapi.com/products';
  final Dio dio;

  ProductService(this.dio);

  Future<List<ProductModel>> getProducts() async {

    try {
      var response = await dio.get(baseUrl);
      Map<String,dynamic> jsonData = response.data;
      List<dynamic> products = jsonData['products'];
      List<ProductModel> productList = [];

      for(var product in products){
        ProductModel productModel = ProductModel.fromJson(product);
        productList.add(productModel);
      }
      return productList;
    }  catch (e) {
      return [];
    }
  }

}
