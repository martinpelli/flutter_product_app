import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'products-app-24b72-default-rtdb.firebaseio.com';

  final List<Product> products = [];
}
