import 'dart:ffi';

import 'package:api_test/src/data/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    super.key,
    // this.product,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDescription(product),
              const SizedBox(height: 40),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                // width: 200,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: product!.images.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      product.images.elementAt(index),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDescription(Product p) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          p.thumbnail,
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Text("${p.brand}/ ${p.category}"),
        Text(p.title),
        Text(p.description),
        Text("Price: \$${p.price}"),
        // Text("Discout percentage: %${p.discountPercentage}"),
        Text(
            "Discout price: \$${(p.price - (p.price * p.discountPercentage / 100))}"),
        Text('Rating: ${p.rating} / 5'),
        Text('Following images: ${p.images.length}'),
      ],
    );
  }
}
