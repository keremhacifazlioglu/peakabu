import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/auth_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_loading.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ConfirmSmsPage extends StatelessWidget {
  const ConfirmSmsPage({Key? key}) : super(key: key);

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
                      headText: "Telefonunuza gönderilen 4 haneli doğrulama kodunu giriniz",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Center(
                          child: FocusScope(
                            node: authProvider.node!,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                        color: PlatformColor.grayLightColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        autofocus: false,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          counterText: "",
                                        ),
                                        controller: authProvider.textEditingControllerList[index],
                                        onEditingComplete: authProvider.node!.nextFocus,
                                        maxLength: 1,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                        onChanged: (value) async {
                                          if (value.length == 1 && index != 3) {
                                            authProvider.node!.nextFocus();
                                          }

                                          if (value.isEmpty && index != 0) {
                                            authProvider.node!.previousFocus();
                                          }
                                          authProvider.smsPin = value;
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const PlatformDefaultText(
                              color: PlatformColorFoundation.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              maxLine: 1,
                              text: "Kalan süre ",
                            ),
                            if (!authProvider.resend)
                              TimerCountdown(
                                format: CountDownTimerFormat.minutesSeconds,
                                enableDescriptions: false,
                                timeTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: PlatformColorFoundation.textColor,
                                    ),
                                endTime: DateTime.now().add(
                                  const Duration(
                                    minutes: 0,
                                    seconds: 180,
                                  ),
                                ),
                                onEnd: () {
                                  authProvider.activateResendMessage();
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (authProvider.resend)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
                        child: GestureDetector(
                          onTap: () {
                            authProvider.resendSms();
                          },
                          child: const PlatformDefaultText(
                            color: PlatformColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            maxLine: 1,
                            text: "Kodu tekrar gönder",
                          ),
                        ),
                      )
                    else
                      Container(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 35, 28, 0),
                      child: PlatformSubmitButton(
                        buttonText: "Onayla",
                        onPressed: () {
                          authProvider.confirmSms().then(
                                (value) => {
                                  if (value.isSuccess!)
                                    {
                                      authProvider.isApplicant().then(
                                            (value) => {
                                              if (value)
                                                {
                                                  Navigator.of(context)
                                                      .pushReplacementNamed("/create_applicant_profile"),
                                                }
                                              else
                                                {
                                                  Navigator.of(context).pushReplacementNamed("/create_my_job_posting"),
                                                }
                                            },
                                          ),
                                    }
                                  else
                                    {
                                      const CustomShowDialog().showDialog(context, "Uyarı", value.message!),
                                    }
                                },
                              );
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
}
