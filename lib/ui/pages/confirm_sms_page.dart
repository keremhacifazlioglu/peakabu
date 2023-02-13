import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/tokens/colors.dart';

class ConfirmSmsPage extends StatelessWidget {
  const ConfirmSmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformColor.offWhiteColor3,
      appBar: AppBar(
        title: const Text("Profil Oluştur"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PlatformHeadText(
                color: PlatformColorFoundation.textColor,
                fontWeight: FontWeight.w400,
                fontSize: PlatformDimensionFoundations.sizeMD,
                headText: "Telefonunuza gönderilen 4 haneli doğrulama kodunu giriniz",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: PlatformColor.grayLightColor,
                        ),
                      ),
                      child: const Center(
                        child: PlatformDefaultText(
                          color: PlatformColorFoundation.textColor,
                          fontSize: PlatformDimensionFoundations.sizeMD,
                          fontWeight: FontWeight.w600,
                          maxLine: 1,
                          text: "1",
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: PlatformColor.grayLightColor,
                        ),
                      ),
                      child: const Center(
                        child: PlatformDefaultText(
                          color: PlatformColorFoundation.textColor,
                          fontSize: PlatformDimensionFoundations.sizeMD,
                          fontWeight: FontWeight.w600,
                          maxLine: 1,
                          text: "2",
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: PlatformColor.grayLightColor,
                        ),
                      ),
                      child: const Center(
                        child: PlatformDefaultText(
                          color: PlatformColorFoundation.textColor,
                          fontSize: PlatformDimensionFoundations.sizeMD,
                          fontWeight: FontWeight.w600,
                          maxLine: 1,
                          text: "3",
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: PlatformColor.grayLightColor,
                        ),
                      ),
                      child: const Center(
                        child: PlatformDefaultText(
                          color: PlatformColorFoundation.textColor,
                          fontSize: PlatformDimensionFoundations.sizeMD,
                          fontWeight: FontWeight.w600,
                          maxLine: 1,
                          text: "4",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 32, 8, 0),
                child: PlatformDefaultText(
                  color: PlatformColorFoundation.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  maxLine: 1,
                  text: "Kalan süre: 04:59",
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
                child: PlatformDefaultText(
                  color: PlatformColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  maxLine: 1,
                  text: "Kodu tekrar gönder",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 35, 28, 0),
                child: PlatformSubmitButton(
                  buttonText: "Onayla",
                  onPressed: () {
                    const CustomShowDialog()
                        .showDialog(context, "Başvurunuz gönderildi",
                            "İletişim talebiniz ilan sahibi tarafından yanıtlandığında bildirim alacaksınız.")
                        .then(
                          (value) => {
                            Navigator.of(context).pushNamed("/create_applicant_profile"),
                          },
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
