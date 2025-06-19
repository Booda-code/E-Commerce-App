import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/update_product_page.dart';
import 'package:flutter/material.dart';

class UpdateProductButton extends StatelessWidget {
  final ProductModel product;

  const UpdateProductButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdateProductPage(product: product),
          ),
        );
      },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 15),
          foregroundColor: Colors.black,
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      child: const Text('Update',style: TextStyle(fontSize: 16, color: Colors.white))
    );
  }
}


