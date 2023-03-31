import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/foundations/typography.dart';

class PlatformGenderButton extends StatelessWidget {
  final String? text;
  final Color? selectedColor;
  final double? width;

  const PlatformGenderButton({
    Key? key,
    this.text,
    this.selectedColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: selectedColor!,
          ),
        ),
        child: Center(
          child: PlatformDefaultText(
            color: selectedColor,
            fontWeight: FontWeight.w600,
            fontSize: PlatformTypographyFoundation.bodyMedium,
            text: text,
          ),
        ),
      ),
    );
  }
}
