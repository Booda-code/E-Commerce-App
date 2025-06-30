import 'package:ecommerce_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/cubits/get_products_cubit/get_products_states.dart';
import 'package:ecommerce_app/pages/add_products_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'E-Commerce App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                var getProductsCubit = BlocProvider.of<GetProductsCubit>(
                    context);
                getProductsCubit.getProducts();
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddProductsPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<GetProductsCubit, GetProductsStates>(
          builder: (context, state) {
            if (state is GetProductsLoadingState) {
              return const Center(child: CircularProgressIndicator(
                color: Colors.black,
              ),);
            } else if (state is GetProductsSuccessState) {
              return CustomProduct(products: state.products,);
            } else {
              return const Center(child: Text('Something went wrong'),);
            }
          },
        ),
      ),
    );
  }
}

// Create States
// Create Cubit
// Create Function
// Provide Cubit
// Integrate Cubit
// Trigger Cubit