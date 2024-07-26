import 'package:flutter/material.dart';
import 'package:flutter_100_projects/product.dart';
import 'package:flutter_100_projects/product_page.dart';
import 'package:flutter_100_projects/shopping_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(product: product);
                },
              ),
            );
          },
          child: Hero(
            tag: product.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageUrl,
                height: 125,
                width: 125,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
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
              Text(
                'Category: ${product.category}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        IconButton.filled(
          onPressed: () {
            context.read<ShoppingCartCubit>().addToCart(product);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
