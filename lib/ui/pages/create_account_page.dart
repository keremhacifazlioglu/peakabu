import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/auth_provider.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_loading.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(authRepository, secureLocalRepository),
      builder: (context, child) {
        var authProvider = Provider.of<AuthProvider>(context);
        return LoadingBody(
          isLoading: authProvider.networkStatus == NetworkStatus.waiting,
          child: Scaffold(
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
                      headText:
                          "Telefon numaranızı girerek hemen uygulamayı kullanmayı başlayın.",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Adınız',
                          contentPadding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                        ),
                        onChanged: (value) {
                          authProvider.phoneNumber = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: authProvider.isKvkkCheck ?? false,
                            onChanged: (value) {
                              authProvider.isKvkkCheck = value!;
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 90,
                            child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text:
                                  const TextSpan(text: '', children: <TextSpan>[
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
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
                        onPressed: () async {
                          await sendSms(authProvider, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future sendSms(AuthProvider authProvider, BuildContext context) async {
    authProvider.sendSms().then(
          (value) => {
            if (value.success!)
              {
                Navigator.of(context).pushNamed("/confirm_sms"),
              }
            else
              {
                const CustomShowDialog().showDialog(
                    context, "Uyarı", value.message ?? "Sms gönderilemedi."),
              }
          },
        );
  }
}
