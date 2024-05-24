import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:api_test/src/features/products/models/product_model.dart';

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

  Container buildImageSlider(BuildContext context, Product product) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 210,
      width: screenWidth,
      child: Column(
        children: [
          const Divider(
            height: 2,
            color: Colors.black45,
          ),
          SizedBox(
            height: 200,
            width: screenWidth,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: product.images!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: screenWidth - 50,
                  child: CachedNetImgWidget(
                      imgUrl: product.images!.elementAt(index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildDescription(Product p) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetImgWidget(
          imgUrl: p.thumbnail!,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Text("${p.brand ?? 'brand'}/ ${p.category ?? 'category'}"),
        Text(p.title!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            p.description!,
            textAlign: TextAlign.justify,
          ),
        ),
        Text("Price: \$${p.price}"),
        // Text("Discount percentage: %${p.discountPercentage}"),
        Text(
            "Discount price: \$${(p.price! - (p.price! * p.discountPercentage! / 100))}"),
        Text('Rating: ${p.rating} / 5 ☆'),
        Text('Following images: ${p.images!.length}'),
        const SizedBox(height: 80),
      ],
    );
  }
}

class CachedNetImgWidget extends StatefulWidget {
  const CachedNetImgWidget({
    super.key,
    required this.imgUrl,
    this.width,
  });

  final String imgUrl;
  final double? width;

  @override
  State<CachedNetImgWidget> createState() => _CachedNetImgWidgetState();
}

class _CachedNetImgWidgetState extends State<CachedNetImgWidget> {
  double? _imageHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImage();
  }

  Future<void> _precacheImage() async {
    final image = NetworkImage(widget.imgUrl);
    await precacheImage(image, context);
    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          _imageHeight = info.image.height.toDouble();
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: _imageHeight ?? 200, // Fallback height while loading
      child: CachedNetworkImage(
        imageUrl: widget.imgUrl,
        fit: BoxFit.contain,
        width: widget.width,
        errorWidget: (context, url, error) => const Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: Colors.red),
        ),
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.grey,
            value: progress.progress,
          ),
        ),
      ),
    );
  }
}
