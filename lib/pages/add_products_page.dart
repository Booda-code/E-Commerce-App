import 'package:ecommerce_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🧠 Controllers
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    final descController = TextEditingController();
    final imageController = TextEditingController();
    final categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(labelText: 'Title', controller: titleController),
            CustomTextField(labelText: 'Price', controller: priceController),
            CustomTextField(labelText: 'Description', controller: descController),
            CustomTextField(labelText: 'Image Url', controller: imageController),
            CustomTextField(labelText: 'Category', controller: categoryController),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final cubit = BlocProvider.of<GetProductsCubit>(context);

                final product = ProductModel(
                  title: titleController.text,
                  description: descController.text,
                  price: double.tryParse(priceController.text) ?? 0.0,
                  imageUrl: imageController.text,
                  category: categoryController.text,
                );

                cubit.postProduct(product);
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
              child: const Text('Add Product', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
