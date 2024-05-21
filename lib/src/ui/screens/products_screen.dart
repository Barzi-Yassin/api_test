import 'package:api_test/main.dart';
import 'package:api_test/src/data/products/product_data.dart';
import 'package:api_test/src/data/products/product_model.dart';
import 'package:api_test/src/data/products/products_model.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Products products = Products.fromMap(productsData);

  @override
  void initState() {
    super.initState();
    debugPrint('$products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          itemCount: products.products.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
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
