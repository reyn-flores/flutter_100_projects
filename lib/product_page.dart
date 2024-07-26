import 'package:flutter/material.dart';
import 'package:flutter_100_projects/product.dart';
import 'package:flutter_100_projects/shopping_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: BlocBuilder<ShoppingCartCubit, int>(
        builder: (context, state) {
          return Column(
            children: [
              Hero(
                tag: product.id,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(product.category),
                        ],
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(product.description),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ShoppingCartCubit>().addToCart(product);
                    },
                    child: const Text('Add to cart'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
