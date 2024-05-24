import 'package:flutter/material.dart';

import 'package:api_test/src/app.dart';
import 'package:api_test/src/features/products/models/product/product_model.dart';
import 'package:api_test/src/features/products/models/product_pack/product_pack_model.dart';
import 'package:api_test/src/features/products/services/local/product_service_local.dart';
import 'package:api_test/src/features/products/services/remote/product_service_remote.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductPack productPack = ProductPack.setBoilerPlate();

  bool switchCurrentValue =
      false; // fetching data from (switchCurrentValue ? api : local)
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchProductsFromLocal; // since the switchCurrentValue init value is 'false', so we fetch products from local data.
  }

  void get fetchProductsFromLocal =>
      setState(() => productPack = ProductServiceLocal.fetchProducts);

  void get fetchProductsFromApi async {
    setState(() => isLoading = true);
    final ProductPack? productsFromApi =
        await ProductServiceRemote.fetchProducts;

    setState(
      () {
        productsFromApi == null
            ? switchCurrentValue = false
            : productPack = productsFromApi;
        isLoading = false;
      },
    );
  }

  void get toggleDataSource => setState(() {
        switchCurrentValue = !switchCurrentValue;
        switchCurrentValue ? {fetchProductsFromApi} : fetchProductsFromLocal;
        debugPrint('switchCurrentValue: $switchCurrentValue');
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Products'),
        actions: [
          textWithBorder("  Local  ", false),
          Switch(
            value: switchCurrentValue,
            onChanged: (_) => toggleDataSource,
          ),
          textWithBorder("  API  ", true),
          const SizedBox(width: 50),
        ],
        bottom: AppBar(
          title: isLoading
              ? const LinearProgressIndicator()
              : Text(
                  // 'Fetching data from "${switchCurrentValue ? 'API' : 'Local'}"',
                  '${productPack.products.length} products from "${switchCurrentValue ? 'API' : 'Local'}"',
                  style: const TextStyle(fontSize: 16),
                ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: productPack.products.isEmpty
            ? const Center(child: Text('No products found!'))
            : isLoading
                ? const SizedBox()
                : (ListView.separated(
                    // here we can return data directly from api using Future or Stream builders (Recommended for production environment)
                    padding: const EdgeInsets.fromLTRB(14, 30, 14, 200),
                    itemCount: productPack.products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final Product product =
                          productPack.products.elementAt(index);
                      return productCard(index, product);
                    },
                  )),
      ),
    );
  }

  Container textWithBorder(String text, bool dataSource) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: switchCurrentValue == dataSource
          ? BoxDecoration(
              border: Border.all(color: Colors.white60, width: 1),
              borderRadius: BorderRadius.circular(15),
            )
          : null,
      child: Text(text),
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
        title: Text(product.title ?? 'title'),
        subtitle: Text(
            "${product.brand ?? 'brand'}/ ${product.category ?? 'category'}"),
        trailing: Text("\$${product.price ?? 'price'} "),
      ),
    );
  }
}
