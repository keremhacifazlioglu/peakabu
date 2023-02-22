import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/ui/molecules/redirect/choose_redirect_button.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ChooseRedirectRow extends StatelessWidget {
  const ChooseRedirectRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: PlatformDimension.sizeLG * 2),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: PlatformDimension.sizeXXS),
              child: ChooseRedirectButton(
                selectedColor: PlatformColor.primaryColor,
                svgPath: "assets/icons/family.svg",
                text: "Yardımcı Arıyorum",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: PlatformDimension.sizeXXS),
              child: ChooseRedirectButton(
                selectedColor: PlatformColor.grayLightColor,
                svgPath: "assets/icons/bakici.svg",
                text: "İş Arıyorum",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
