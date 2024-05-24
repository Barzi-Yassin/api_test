import 'package:api_test/src/features/products/data/product_pack_data_2.dart';
import 'package:api_test/src/features/products/models/product_pack/product_pack_model.dart';

class ProductServiceLocal {
  static ProductPack get fetchProducts => ProductPack.fromMap(productPackData2);
}
