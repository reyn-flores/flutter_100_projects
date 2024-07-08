import 'package:flutter/material.dart';
import 'package:flutter_100_projects/product.dart';
import 'package:flutter_100_projects/product_item.dart';
import 'package:flutter_100_projects/shopping_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => ShoppingCartCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Shopping Cart'),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context
                      .read<ShoppingCartCubit>()
                      .addToCart(mockProductList[index]);
                },
                child: ProductItem(product: mockProductList[index]),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: mockProductList.length,
          ),
          floatingActionButton: Badge.count(
            count: state,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        );
      },
    );
  }
}
