import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'products-app-24b72-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  late Product selectedProduct;
  bool isSaving = false;

  final storage = FlutterSecureStorage();

  File? newPictureFile;

  ProductService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final idToken = await storage.read(key: 'idToken');

    final url = Uri.https(_baseUrl, 'products.json', {'auth': idToken ?? ''});
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value) {
      final product = Product.fromMap(value);
      product.setId = key;

      products.add(product);
    });

    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      product.id = await createProduct(product);
      products.add(product);
    } else {
      String updatedProductId = await updateProduct(product);
      int indexOfProductToUpdate = products.indexWhere((element) => product.id == updatedProductId);
      products[indexOfProductToUpdate] = product;
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json', {'auth': await storage.read(key: 'idToken') ?? ''});
    final response = await http.put(url, body: product.toJson());
    final decodedData = response.body;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json', {'auth': await storage.read(key: 'idToken') ?? ''});
    final response = await http.post(url, body: product.toJson());
    final decodedData = json.decode(response.body);

    return decodedData['name'];
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadIamge() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dnistcuvr/image/upload?upload_preset=ojymdlyl');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    newPictureFile = null;

    final decodedData = json.decode(response.body);
    return decodedData['secure_url'];
  }
}
