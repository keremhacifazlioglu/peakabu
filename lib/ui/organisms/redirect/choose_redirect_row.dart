import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform/ui/molecules/redirect/choose_redirect_button.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ChooseRedirectRow extends StatefulWidget {
  const ChooseRedirectRow({Key? key}) : super(key: key);

  @override
  State<ChooseRedirectRow> createState() => _ChooseRedirectRowState();
}

class _ChooseRedirectRowState extends State<ChooseRedirectRow> {
  Color selectedColorAmbassador = PlatformColor.primaryColor, selectedColorApplicant = PlatformColor.grayLightColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: PlatformDimension.sizeLG * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: PlatformDimension.sizeXXS),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorAmbassador = PlatformColor.primaryColor;
                  selectedColorApplicant = PlatformColor.grayLightColor;
                });
                secureLocalRepository.writeSecureData(
                  StorageItem("userType", "ambasador"),
                );
                Navigator.of(context).pushNamed("/ambassador");
              },
              child:  ChooseRedirectButton(
                selectedColor: selectedColorAmbassador,
                svgPath: "assets/icons/family.svg",
                text: "Yardımcı Arıyorum",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PlatformDimension.sizeXXS),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorApplicant = PlatformColor.primaryColor;
                  selectedColorAmbassador = PlatformColor.grayLightColor;
                });
                secureLocalRepository.writeSecureData(
                  StorageItem("userType", "applicant"),
                );
                Navigator.of(context).pushNamed("/applicant");
              },
              child:  ChooseRedirectButton(
                selectedColor: selectedColorApplicant,
                svgPath: "assets/icons/bakici.svg",
                text: "İş Arıyorum",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
