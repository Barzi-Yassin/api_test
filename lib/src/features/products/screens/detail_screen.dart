import 'package:api_test/src/features/products/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Product product;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    product = ModalRoute.of(context)!.settings.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: buildDescription(product),
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Icon(
                Icons.circle,
                color: Colors.blueGrey.shade300,
                size: 35,
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildImageSlider(context, product),
    );
  }

  Widget buildImageSlider(BuildContext context, Product product) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 200,
      width: screenWidth,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: screenWidth - 50,
            child: CachedNetworkImage(
              imageUrl: product.images.elementAt(index),
              fit: BoxFit.contain,
              height: 185,
            ),
          ),
        ),
      ),
    );
  }

  Column buildDescription(Product p) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: p.thumbnail,
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        // Image.network(
        //   p.thumbnail,
        //   fit: BoxFit.contain,
        //   width: double.infinity,
        // ),
        const SizedBox(height: 20),
        Text("${p.brand}/ ${p.category}"),
        Text(p.title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            p.description,
            textAlign: TextAlign.justify,
          ),
        ),
        Text("Price: \$${p.price}"),
        // Text("Discount percentage: %${p.discountPercentage}"),
        Text(
            "Discount price: \$${(p.price - (p.price * p.discountPercentage / 100))}"),
        Text('Rating: ${p.rating} / 5 ☆'),
        Text('Following images: ${p.images.length}'),
        const SizedBox(height: 20),
      ],
    );
  }
}
