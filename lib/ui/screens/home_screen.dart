import 'package:flutter/material.dart';
import 'package:flutter_products_app/services/services.dart';
import 'package:flutter_products_app/ui/screens/loading_screen.dart';
import 'package:flutter_products_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
          itemCount: productsService.products.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                productsService.selectedProduct = productsService.products[index].copy();
                Navigator.pushNamed(context, 'product');
              },
              child: ProductCard(
                product: productsService.products[index],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productsService.selectedProduct = Product(available: false, name: '', price: 0.0);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
