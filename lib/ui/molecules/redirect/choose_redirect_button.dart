import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/typography.dart';

class ChooseRedirectButton extends StatelessWidget {
  final String? svgPath, text;
  final Color? selectedColor;

  const ChooseRedirectButton({
    Key? key,
    this.svgPath,
    this.selectedColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 144,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: selectedColor!,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlatformIcon(
              color: selectedColor,
              height: 48,
              width: 48,
              svgPath: svgPath!,
            ),
            PlatformDefaultText(
              color: selectedColor,
              fontWeight: FontWeight.w400,
              fontSize: PlatformTypographyFoundation.bodyMedium,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
