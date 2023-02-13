import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class SpecialForMeItem extends StatelessWidget {

  final String? svgPath,title;

  const SpecialForMeItem({Key? key,this.svgPath,this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: PlatformColor.offDarkWhiteColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 4),
                child: PlatformIcon(
                  color: PlatformColor.primaryColor,
                  height: 20,
                  width: 20,
                  svgPath: svgPath!,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: PlatformDefaultText(
                color: PlatformColorFoundation.textColor,
                maxLine: 1,
                text: title!,
                fontSize: PlatformTypographyFoundation.bodyLarge,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: PlatformIcon(
                  color: PlatformColor.primaryColor,
                  height: 20,
                  width: 20,
                  svgPath: "assets/icons/chevron_right.svg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
