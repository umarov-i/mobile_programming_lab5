import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String name;
  final double price;
  const Product(this.name, this.price);
}

final productCatalog = [
  const Product('Laptop', 999.0),
  const Product('Phone', 599.5),
  const Product('Headphones', 79.9),
];

class Task6_3App extends StatelessWidget {
  const Task6_3App({super.key});

  static final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '/product-details',
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products (extra)')),
      body: ListView(
        children: productCatalog
            .map((p) => ListTile(
                  title: Text(p.name),
                  subtitle: Text('\$${p.price}'),
                  onTap: () => context.push('/product-details', extra: p),
                ))
            .toList(),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Text('Price: \$${product.price}', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}