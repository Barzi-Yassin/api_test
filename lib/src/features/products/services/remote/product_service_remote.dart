import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_test/src/features/products/models/product_pack/product_pack_model.dart';

class ProductServiceRemote {
  static const String _url = 'https://dummyjson.com/products';

  static Future<ProductPack?> get fetchProducts async {
    ProductPack? output;
    try {
      debugPrint('1');
      final http.Response response = await http.get(Uri.parse(_url));
      debugPrint('2');
      if (response.statusCode == 200) {
        output = ProductPack.fromJson(response.body);
        debugPrint('ssssssssssssss response.body::::: ${response.body}');
        debugPrint('ssssssssssssss output :::: ${output}');
      } else {
        debugPrint('HTTP response status code is not 200!');
      }
      debugPrint('3');
    } catch (e) {
      debugPrint(
          'Something went wrong while fetching products from an API call:');
      debugPrint('Caught error: $e');
    }
    return output;
  }
}
