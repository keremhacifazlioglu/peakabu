import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';

class PlatformTabMenu extends StatelessWidget {
  final double? width;
  final String? text;
  final Color? borderColor, textColor, color;

  const PlatformTabMenu({
    Key? key,
    this.width,
    this.text,
    this.borderColor,
    this.textColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 64) / 2,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: borderColor!,
        ),
        color: color,
      ),
      child: Center(
        child: PlatformDefaultText(
          color: textColor,
          fontWeight: FontWeight.w400,
          text: text,
          fontSize: 15,
        ),
      ),
    );
  }
}
