import 'package:api_test/main.dart';
import 'package:api_test/src/features/products/data/product_data.dart';
import 'package:api_test/src/features/products/models/product_model.dart';
import 'package:api_test/src/features/products/models/product_pack_model.dart';
import 'package:api_test/src/features/products/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductPack products;

  bool switchCurrentValue =
      false; // fetching data from (switchCurrentValue ? api : local)

  @override
  void initState() {
    super.initState();
    fetchProductsFromLocal; // since the switchCurrentValue init value is 'false', so we fetch products from local data.
    // debugPrint('$products');
  }

  void get fetchProductsFromLocal =>
      setState(() => products = ProductPack.fromMap(productsData));

  void get fetchProductsFromApi async {
    final ProductPack? productsFromApi = await ProductService.fetchProducts;
    setState(
      () => productsFromApi == null
          ? switchCurrentValue = false
          : products = productsFromApi,
    );
  }

  void get toggleDataSource => setState(() {
        switchCurrentValue = !switchCurrentValue;
        if (switchCurrentValue == true) {
          fetchProductsFromApi;
        }
        debugPrint('switchCurrentValue: $switchCurrentValue');
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Products'),
        actions: [
          const Text('Local  '),
          Switch(
            value: switchCurrentValue,
            onChanged: (_) => toggleDataSource,
          ),
          const Text('  API'),
          const SizedBox(width: 50),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: products.products.isEmpty
            ? const Center(child: Text('No products found!'))
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
                itemCount: products.products.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final Product product = products.products.elementAt(index);
                  return productCard(index, product);
                },
              ),
      ),
    );
  }

  Card productCard(int index, Product product) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          Routes.detailScreen,
          arguments: product,
        ),
        leading: Text("${index + 1}"),
        title: Text(product.title),
        subtitle: Text("${product.brand}/ ${product.category}"),
        trailing: Text("\$${product.price} "),
      ),
    );
  }
}
