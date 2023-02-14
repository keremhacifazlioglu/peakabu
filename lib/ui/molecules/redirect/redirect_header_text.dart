import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_image.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';
import 'package:platform/ui/tokens/typography.dart';

class RedirectHeaderText extends StatelessWidget {
  const RedirectHeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(
              PlatformDimension.sizeMD,
              PlatformDimension.sizeMD * 6,
              PlatformDimension.sizeMD,
              PlatformDimension.sizeMD * 4,
            ),
            child: PlatformImage(
              width: 100,
              height: 100,
              imagePath: 'assets/images/yeniyardMcM1.png',
            ),
          ),
          PlatformDefaultText(
            text: "Seçim yapınız",
            fontSize: PlatformTypography.sizeXL,
            fontWeight: FontWeight.w600,
          ),
          PlatformHeadText(
            headText:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit et dolore magna aliqua",
            fontWeight: FontWeight.w200,
            color: PlatformColorFoundation.textColor,
            fontSize: PlatformTypography.sizeSL,
          ),
        ],
      ),
    );
  }
}
