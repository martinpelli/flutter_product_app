import 'package:flutter/material.dart';
import 'package:flutter_products_app/ui/screens/screens.dart';

void main() => runApp(ProductsApp());

class ProductsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Products App',
      routes: {'login': (_) => LoginScreen()},
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
