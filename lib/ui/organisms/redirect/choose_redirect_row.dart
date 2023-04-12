import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/storage/storage_item.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/molecules/redirect/choose_redirect_button.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:peakabu/ui/tokens/sizes.dart';

class ChooseRedirectRow extends StatefulWidget {
  const ChooseRedirectRow({Key? key}) : super(key: key);

  @override
  State<ChooseRedirectRow> createState() => _ChooseRedirectRowState();
}

class _ChooseRedirectRowState extends State<ChooseRedirectRow> {
  Color selectedColorRecruiter = PlatformColor.grayLightColor, selectedColorApplicant = PlatformColor.grayLightColor;

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
                setState(() {
                  selectedColorRecruiter = PlatformColor.primaryColor;
                  selectedColorApplicant = PlatformColor.grayLightColor;
                });
                await Future.delayed(
                  const Duration(milliseconds: 100),
                );
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
              child: ChooseRedirectButton(
                selectedColor: selectedColorRecruiter,
                svgPath: "assets/icons/family.svg",
                text: "Yardımcı Arıyorum",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PlatformDimension.sizeXXS),
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  selectedColorApplicant = PlatformColor.primaryColor;
                  selectedColorRecruiter = PlatformColor.grayLightColor;
                });
                await Future.delayed(
                  const Duration(milliseconds: 100),
                );
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
              child: ChooseRedirectButton(
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
