// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    required this.abc123,
    required this.abc789,
  });

  final Abc abc123;
  final Abc abc789;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        abc123: Abc.fromMap(json["ABC123"]),
        abc789: Abc.fromMap(json["ABC789"]),
      );

  Map<String, dynamic> toMap() => {
        "ABC123": abc123.toMap(),
        "ABC789": abc789.toMap(),
      };
}

class Abc {
  Abc({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
  });

  final bool available;
  final String name;
  final String? picture;
  final int price;

  factory Abc.fromMap(Map<String, dynamic> json) => Abc(
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
}
