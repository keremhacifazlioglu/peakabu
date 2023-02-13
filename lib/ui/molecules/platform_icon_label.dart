import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/tokens/typography.dart';

class PlatformIconLabel extends StatelessWidget {

  final String? labelIconPath,labelText;

  const PlatformIconLabel({
    Key? key,
    this.labelIconPath,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlatformIcon(
          color: PlatformColorFoundation.textColor,
          width: 10,
          height: 15,
          svgPath: labelIconPath,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: PlatformDefaultText(
            text: labelText,
            fontWeight: FontWeight.w400,
            fontSize: PlatformTypography.sizeSM,
            color: PlatformColorFoundation.textColor,
          ),
        ),
      ],
    );
  }
}
