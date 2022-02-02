import 'dart:convert';

import '../../domain/entities/result_products.dart';

class Products extends ResultProduct {
  Products(
    String name,
    String photo,
    String description,
  ) : super(name, photo, description);

  Map<String, dynamic> toMap() {
    return {
      'title': name,
      'thumb': photo,
      'description': description,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      map['title'] ?? '',
      map['thumb'] ?? '',
      map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));
}
