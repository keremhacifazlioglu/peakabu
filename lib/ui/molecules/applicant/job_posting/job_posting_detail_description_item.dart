import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobPostingDetailDescriptionItem extends StatelessWidget {
  const JobPostingDetailDescriptionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PlatformDefaultText(
            text: "İlan Detayları",
            fontWeight: FontWeight.w600,
            fontSize: PlatformTypographyFoundation.titleSmall,
            color: PlatformColorFoundation.textColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: PlatformDefaultText(
              text:
                  "Sigara içmeyen, 30-45 yaş aralığında pozitif, tecrübeli, çocuk sevgisi olan, işini severek yapan, kendi çocukları problem olmayacak, ayda 26 gün çalısacak, sabah 8:30 aksam 17:10 arası, maaş artısı temmuz ayından itibaren asgari ücret artısı oranında olacaktır",
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
