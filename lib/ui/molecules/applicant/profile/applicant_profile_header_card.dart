import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';
import 'package:platform/ui/tokens/colors.dart';

class ApplicantProfileHeaderCard extends StatelessWidget {
  const ApplicantProfileHeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: PlatformColor.offWhiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: PlatformDefaultText(
                      text: "Hatice C., 45",
                      fontWeight: FontWeight.w600,
                      fontSize: PlatformTypographyFoundation.titleMedium,
                      color: PlatformColorFoundation.textColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: PlatformIconLabel(
                      labelText: "Esenyurt",
                      labelIconPath: "assets/icons/location.svg",
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4, left: 20),
              child: PlatformDefaultText(
                text: "Çocuk Bakıcısı",
                fontWeight: FontWeight.w400,
                fontSize: PlatformTypographyFoundation.bodyLarge,
                color: PlatformColorFoundation.textColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20,bottom: 16),
              child: Row(
                children: const [
                  PlatformDefaultText(
                    text: "Son Giriş Tarihi : ",
                    fontWeight: FontWeight.w400,
                    fontSize: PlatformTypographyFoundation.bodyLarge,
                    color: PlatformColorFoundation.textColor,
                  ),
                  PlatformDefaultText(
                    text: "27.01.2023",
                    fontWeight: FontWeight.w400,
                    fontSize: PlatformTypographyFoundation.bodyLarge,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
