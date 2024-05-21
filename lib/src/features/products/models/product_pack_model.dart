import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:api_test/src/features/products/models/product_model.dart';

class ProductPack {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;
  ProductPack({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  ProductPack copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductPack(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory ProductPack.fromMap(Map<String, dynamic> map) {
    return ProductPack(
      products: List<Product>.from(
        (map['products'] as List<Map<String, Object>>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'].toInt() as int,
      skip: map['skip'].toInt() as int,
      limit: map['limit'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPack.fromJson(String source) =>
      ProductPack.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(covariant ProductPack other) {
    if (identical(this, other)) return true;

    return listEquals(other.products, products) &&
        other.total == total &&
        other.skip == skip &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
  }
}
