import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlatformIcon extends StatelessWidget {
  final double? width, height;
  final Color? color;
  final String? svgPath;

  const PlatformIcon({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        svgPath!,
        color: color,
      ),
    );
  }
}
