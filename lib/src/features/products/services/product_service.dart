import 'dart:convert';

import 'package:api_test/src/features/products/models/product_pack_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String _url = 'https://dummyjson.com/products';

  static Future<ProductPack?> get fetchProducts async {
    ProductPack? output;
    try {
      final http.Response response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // debugPrint('jsonData: $jsonData');
        debugPrint('jsonData runtime type: ${jsonData.runtimeType}');
        output = ProductPack.fromMap(jsonData);
      } else {
        debugPrint('http response status code is not 200 !');
      }
    } catch (e) {
      debugPrint(
          'something went wrong!, while fetching products from an api call:::::');
      debugPrint(':::catched error::: $e');
    }
    return output;
  }
}
