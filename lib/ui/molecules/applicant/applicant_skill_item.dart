import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class ApplicantSkillItem extends StatelessWidget {
  final String? skillPlatformLabel, skillDescription;

  const ApplicantSkillItem({
    Key? key,
    this.skillDescription,
    this.skillPlatformLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlatformDefaultText(
            text: skillPlatformLabel!,
            fontWeight: FontWeight.w600,
            fontSize: PlatformTypographyFoundation.bodyLarge,
            color: PlatformColorFoundation.textColor,
          ),
          PlatformDefaultText(
            text: skillDescription??"",
            fontWeight: FontWeight.w400,
            fontSize: PlatformTypographyFoundation.bodyLarge,
            color: PlatformColor.grayLightColor,
          ),
        ],
      ),
    );
  }
}
