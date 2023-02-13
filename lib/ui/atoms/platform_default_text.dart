import 'package:flutter/material.dart';

class PlatformDefaultText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLine;

  const PlatformDefaultText({
    Key? key,
    this.fontWeight,
    this.fontSize,
    this.text,
    this.color,
    this.maxLine = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
