import 'package:ecommerce_app/cubits/post_products_cubit/post_products_cubit.dart';
import 'package:ecommerce_app/cubits/post_products_cubit/post_products_states.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? title, price, desc, image, category;
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => PostProductsCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<PostProductsCubit, PostProductsStates>(
            listener: (context, state) {
              if (state is PostProductsSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Product added successfully!')),
                );
                Navigator.of(context).pop();
              } else if (state is PostProductsErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to add product!')),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Add Product', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.deepPurple,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Title',
                        onChanged: (value) => title = value,
                      ),
                      CustomTextFormField(
                        labelText: 'Price',
                        onChanged: (value) => price = value,
                      ),
                      CustomTextFormField(
                        labelText: 'Description',
                        onChanged: (value) => desc = value,
                      ),
                      CustomTextFormField(
                        labelText: 'Image Url',
                        onChanged: (value) => image = value,
                      ),
                      CustomTextFormField(
                        labelText: 'Category',
                        onChanged: (value) => category = value,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final cubit = BlocProvider.of<PostProductsCubit>(context);
                              final product = ProductModel(
                                title: title ?? '',
                                description: desc ?? '',
                                price: double.tryParse(price ?? '0.0') ?? 0.0,
                                image: image ?? '',
                              );
                              cubit.postProduct(product);
                            }
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
              ),
            ),
          );
        },
      ),
    );
  }
}
