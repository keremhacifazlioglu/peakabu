import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/molecules/redirect/choose_redirect_button.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ChooseRedirectRow extends StatefulWidget {
  const ChooseRedirectRow({Key? key}) : super(key: key);

  @override
  State<ChooseRedirectRow> createState() => _ChooseRedirectRowState();
}

class _ChooseRedirectRowState extends State<ChooseRedirectRow> {
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
              onTap: () async {
                secureLocalRepository.readSecureData("userType2").then(
                      (value) => {
                        if (value == null || value == "recruiter")
                          {
                            secureLocalRepository.writeSecureData(
                              StorageItem("userType", "recruiter"),
                            ),
                            Navigator.of(context, rootNavigator: true).pushNamed("/recruiter"),
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: PlatformDefaultText(
                                  text: "Aday olarak kayıt olduktan sonra ebeveyn olarak işlem yapılamaz",
                                  color: PlatformColor.offWhiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          }
                      },
                    );
              },
              child: const ChooseRedirectButton(
                selectedColor: PlatformColor.grayLightColor,
                svgPath: "assets/icons/family.svg",
                text: "Yardımcı Arıyorum",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PlatformDimension.sizeXXS),
            child: GestureDetector(
              onTap: () async {
                secureLocalRepository.readSecureData("userType2").then(
                      (value) => {
                        if (value == null || value == "applicant")
                          {
                            secureLocalRepository.writeSecureData(
                              StorageItem("userType", "applicant"),
                            ),
                            Navigator.of(context, rootNavigator: true).pushNamed("/applicant"),
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: PlatformDefaultText(
                                  text: "Ebeveyn olarak kayıt olduktan sonra aday olarak işlem yapılamaz",
                                  color: PlatformColor.offWhiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          }
                      },
                    );
              },
              child: const ChooseRedirectButton(
                selectedColor: PlatformColor.grayLightColor,
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
