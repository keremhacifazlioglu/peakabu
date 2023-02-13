import 'package:flutter/material.dart';

class PlatformImage extends StatelessWidget {
  final double? width, height;
  final String? imagePath;

  const PlatformImage({
    Key? key,
    this.width,
    this.height,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(imagePath!),
      ),
    );
  }
}
