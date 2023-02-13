import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class ApplicantProfileDescriptionCard extends StatelessWidget {
  const ApplicantProfileDescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: PlatformColor.offWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PlatformDefaultText(
              text: "Çocuklarınızı kendi çocuklarımdan ayırmam.",
              fontWeight: FontWeight.w600,
              fontSize: PlatformTypographyFoundation.titleSmall,
              color: PlatformColorFoundation.textColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: PlatformDefaultText(
                text:
                    "Merhaba ben Fatma. 11 yıl 2 ay deneyimim var. Bir ailenin yeni doğmuş bebeğine 11 yaşına kadar annelik yaptım. 6 yaşına geldiğinde bir kardeşi oldu. Çocuklarla ilgilenmekten keyif alıyorum, hiç yorulmuyorum. Daha sonra Mira bebeğe de 6 yıl baktım. Okula başladıkları için ayrıldım hepsinden ama hala görüşüyorum.",
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
