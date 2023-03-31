import 'package:flutter/material.dart';
import 'package:peakabu/ui/foundations/sizes.dart';

class PlatformHeadText extends StatelessWidget {
  final String? headText;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const PlatformHeadText({
    Key? key,
    this.headText,
    this.color,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        PlatformDimensionFoundations.sizeXL,
        PlatformDimensionFoundations.sizeXL,
        PlatformDimensionFoundations.sizeXL,
        PlatformDimensionFoundations.sizeXL,
      ),
      child: Text(
        headText!,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: fontSize!,
              fontWeight: fontWeight!,
              color: color!,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
