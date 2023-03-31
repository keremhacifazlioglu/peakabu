import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/typography.dart';
import 'package:peakabu/ui/tokens/colors.dart';

class ApplicantProfileDescriptionCard extends StatelessWidget {
  final String? descTitle, desc;

  const ApplicantProfileDescriptionCard({
    Key? key,
    this.desc,
    this.descTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: PlatformColor.offWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlatformDefaultText(
              text: descTitle,
              fontWeight: FontWeight.w600,
              fontSize: PlatformTypographyFoundation.titleSmall,
              color: PlatformColorFoundation.textColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: PlatformDefaultText(
                text: desc,
                fontWeight: FontWeight.w400,
                fontSize: PlatformTypographyFoundation.bodyMedium + 1,
                color: PlatformColor.grayLightColor,
                maxLine: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
