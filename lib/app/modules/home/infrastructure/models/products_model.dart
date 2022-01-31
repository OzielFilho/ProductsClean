import 'dart:convert';

import 'package:agence_teste/app/modules/home/domain/entities/result_products.dart';

class Products extends ResultProduct {
  // ignore: annotate_overrides, overridden_fields
  final String name;
  // ignore: annotate_overrides, overridden_fields
  final String photo;
  // ignore: annotate_overrides, overridden_fields
  final String description;
  Products(
    this.name,
    this.photo,
    this.description,
  ) : super(name, photo, description);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'description': description,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      map['name'] ?? '',
      map['photo'] ?? '',
      map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));
}
