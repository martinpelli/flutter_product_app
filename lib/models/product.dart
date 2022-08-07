// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({required this.available, required this.name, this.picture, required this.price, this.id});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  set setId(String? id) {
    this.id = id;
  }

  Product copy() => Product(
        available: available,
        name: name,
        price: price,
        id: id,
        picture: picture,
      );
}
