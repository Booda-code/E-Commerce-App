import 'package:ecommerce_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/cubits/update_products_cubit/update_products_cubit.dart';
import 'package:ecommerce_app/cubits/update_products_cubit/update_products_states.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductModel product;
final GetProductsCubit getProductsCubit;
  const UpdateProductPage({super.key, required this.product, required this.getProductsCubit});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {

  String? updatedTitle;
  String? updatedPrice;
  String? updatedDesc;
  String? updatedImage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocProvider(
        create: (context) => UpdateProductsCubit(),
        child: BlocConsumer<UpdateProductsCubit, UpdateProductsStates>(
          listener: (context, state) {
            if (state is UpdateProductsSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product updated successfully!')),
              );
              widget.getProductsCubit.getProducts();
              Navigator.of(context).pop();

            } else if (state is UpdateProductsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to update product')),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(labelText: 'Title',initialValue: widget.product.title,onChanged: (value) => updatedTitle = value,),
                    CustomTextFormField(labelText: 'Price',initialValue: widget.product.price.toString(),onChanged: (value) => updatedPrice = value,),
                    CustomTextFormField(labelText: 'Description',initialValue: widget.product.description,onChanged: (value) => updatedDesc = value,),
                    CustomTextFormField(labelText: 'Image Url',initialValue: widget.product.image,onChanged: (value) => updatedImage = value,),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final updatedProduct = ProductModel(
                              id: widget.product.id,
                              title: updatedTitle ?? widget.product.title,
                              description: updatedDesc ?? widget.product.description,
                              price: double.tryParse(updatedPrice ?? widget.product.price.toString()) ?? 0.0,
                              image: updatedImage ?? widget.product.image,
                            );
                            BlocProvider.of<UpdateProductsCubit>(context).updateProduct(updatedProduct);
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
                      child: const Text('Update Product', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
