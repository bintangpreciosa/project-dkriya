// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) {
  final jsonData = json.decode(str);
  return jsonData != null
      ? List<Product>.from(jsonData.map((x) => Product.fromJson(x)))
      : [];
}


String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int? id;
    String? name;
    double? price;
    String? imageUrl;

    Product({
        this.id,
        this.name,
        this.price,
        this.imageUrl,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "imageUrl": imageUrl,
    };
}
