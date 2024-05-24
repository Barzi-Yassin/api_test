import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
