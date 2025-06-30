import 'package:ecommerce_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/cubits/update_products_cubit/update_products_cubit.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductButton extends StatelessWidget {
  final ProductModel product;
  final GetProductsCubit getProductsCubit;

  const UpdateProductButton({
    super.key,
    required this.product,
    required this.getProductsCubit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => UpdateProductsCubit(),
              child: UpdateProductPage(
                product: product,
                getProductsCubit: getProductsCubit,
              ),
            ),
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
      child: const Text('Update', style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
