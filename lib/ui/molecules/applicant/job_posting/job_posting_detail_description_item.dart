import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobPostingDetailDescriptionItem extends StatelessWidget {
  final String? jobPostingDescription;

  const JobPostingDetailDescriptionItem({
    Key? key,
    this.jobPostingDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PlatformDefaultText(
            text: "İlan Detayları",
            fontWeight: FontWeight.w600,
            fontSize: PlatformTypographyFoundation.titleSmall,
            color: PlatformColorFoundation.textColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PlatformDefaultText(
              text: jobPostingDescription!,
              fontWeight: FontWeight.w400,
              fontSize: PlatformTypographyFoundation.bodyMedium + 1,
              color: PlatformColor.grayLightColor,
              maxLine: 7,
            ),
          ),
        ],
      ),
    );
  }
}
