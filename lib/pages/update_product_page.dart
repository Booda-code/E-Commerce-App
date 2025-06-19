import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductPage extends StatelessWidget {
  final ProductModel product;

  const UpdateProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: product.title);
    final priceController = TextEditingController(text: product.price.toString());
    final descController = TextEditingController(text: product.description);
    final imageController = TextEditingController(text: product.imageUrl);
    final categoryController = TextEditingController(text: product.category);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          CustomTextField(labelText: 'Title', controller: titleController),
          CustomTextField(labelText: 'Price', controller: priceController),
          CustomTextField(labelText: 'Description', controller: descController),
          CustomTextField(labelText: 'Image Url', controller: imageController),
          CustomTextField(labelText: 'Category', controller: categoryController),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final updatedProduct = ProductModel(
                id: product.id,
                title: titleController.text,
                description: descController.text,
                price: double.tryParse(priceController.text) ?? 0.0,
                imageUrl: imageController.text,
                category: categoryController.text,
              );

              BlocProvider.of<GetProductsCubit>(context).updateProduct(updatedProduct);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              foregroundColor: Colors.black,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Update Product', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
