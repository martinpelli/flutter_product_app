import 'package:flutter/material.dart';
import 'package:flutter_products_app/ui/screens/login_screen.dart';

void main() => runApp(ProductsApp());

class ProductsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, initialRoute: 'login', title: 'Material App', home: LoginScreen());
  }
}
