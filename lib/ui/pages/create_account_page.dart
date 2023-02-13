import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/atoms/platform_text_form_input.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/tokens/colors.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

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
                headText: "Telefon numaranızı girerek hemen uygulamayı kullanmayı başlayın.",
              ),
              const PlatformTextFormInput(
                labelText: "Telefon Numarınız",
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 90,
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(text: '', children: <TextSpan>[
                          TextSpan(
                            text: 'Kullanım Şartları’nı',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: ' ve ',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          TextSpan(
                            text: ' Gizlilik Politikası’nı',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: ' kabul ediyorum.',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 35, 28, 0),
                child: PlatformSubmitButton(
                  buttonText: "Devam et",
                  onPressed: () {
                    Navigator.of(context).pushNamed("/confirm_sms");
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
