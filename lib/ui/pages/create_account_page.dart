import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/auth_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_head_text.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/atoms/platform_loading.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(authRepository, secureLocalRepository),
      builder: (context, child) {
        var authProvider = Provider.of<AuthProvider>(context);
        return LoadingBody(
          isLoading: authProvider.networkStatus == NetworkStatus.waiting,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: PlatformColor.offWhiteColor3,
            appBar: AppBar(
              title: const Text("Profil Oluştur"),
              centerTitle: true,
              automaticallyImplyLeading: true,
              actionsIconTheme: const IconThemeData(color: Colors.white),
              actions: [Container()],
            ),
            endDrawer: Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlatformDefaultText(
                          fontSize: PlatformTypographyFoundation.titleSmall,
                          color: PlatformColor.grayLightColor,
                          maxLine: 1,
                          text: authProvider.termOfUse ? "Kullanım Şartları" : "Gizlilik Sözleşmesi",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                        child: GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.closeEndDrawer();
                          },
                          child: const PlatformIcon(
                            color: PlatformColor.grayLightColor,
                            height: 18,
                            width: 18,
                            svgPath: "assets/icons/close.svg",
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(
                      thickness: 0.5,
                      color: PlatformColor.grayLightColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      authProvider.termOfUse
                          ? '''  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque. Nunc id cursus metus aliquam. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Sed id semper risus in hendrerit gravida rutrum. Leo urna molestie at elementum eu facilisis sed odio. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Metus dictum at tempor commodo. Faucibus interdum posuere lorem ipsum dolor sit. Eget lorem dolor sed viverra ipsum nunc. Orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. scelerisque eleifend donec pretium vulputate. Pellentesque elit eget gravida cum sociis natoque penatibus et.Sit amet mauris commodo quis imperdiet massa. Gravida neque convallis a cras. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant. Ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget. Purus sit amet volutpat consequat. Sem et tortor consequat id. Quam lacus suspendisse faucibus interdum posuere lorem. Ultricies tristique nulla aliquet enim tortor at auctor. Mollis aliquam ut porttitor leo a diam sollicitudin tempor. Dolor sit amet consectetur adipiscing elit duis tristique. Fermentum odio eu feugiat pretium nibh ipsum. Vitae auctor eu augue ut lectus arcu bibendum at.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque. Nunc id cursus metus aliquam. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Sed id semper risus in hendrerit gravida rutrum. Leo urna molestie at elementum eu facilisis sed odio. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Metus dictum at tempor commodo. Faucibus interdum posuere lorem ipsum dolor sit. Eget lorem dolor sed viverra ipsum nunc. Orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. scelerisque eleifend donec pretium vulputate. Pellentesque elit eget gravida cum sociis natoque penatibus et.Sit amet mauris commodo quis imperdiet massa. Gravida neque convallis a cras. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant. Ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget. Purus sit amet volutpat consequat. Sem et tortor consequat id. Quam lacus suspendisse faucibus interdum posuere lorem. Ultricies tristique nulla aliquet enim tortor at auctor. Mollis aliquam ut porttitor leo a diam sollicitudin tempor. Dolor sit amet consectetur adipiscing elit duis tristique. Fermentum odio eu feugiat pretium nibh ipsum. Vitae auctor eu augue ut lectus arcu bibendum at.'''
                          : "Privacy",
                      style: const TextStyle(color: Colors.black),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            endDrawerEnableOpenDragGesture: false,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: IntlPhoneField(
                        decoration: const InputDecoration(
                          labelText: 'Telefon numarası',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {
                          authProvider.phoneNumber =phone.completeNumber;
                        },
                        countries: const ["TR"],
                        initialCountryCode: "TR",
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: authProvider.isKvkkCheck,
                            onChanged: (value) {
                              authProvider.enableKvkk();
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 90,
                            child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(text: '', children: <TextSpan>[
                                TextSpan(
                                  text: 'Kullanım Şartları’nı',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await authProvider.enableTermOfUse();
                                      _scaffoldKey.currentState!.openEndDrawer();
                                    },
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' ve ',
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                                TextSpan(
                                  text: ' Gizlilik Politikası’nı',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await authProvider.enablePrivacyPolicy();
                                      _scaffoldKey.currentState!.openEndDrawer();
                                    },
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(
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
                        onPressed: () async {
                          authProvider.isKvkkCheck
                              ? await register(authProvider, context)
                              : const CustomShowDialog()
                                  .showDialog(context, "Uyarı", "Lütfen yasal metinleri okuyup onaylayınız.");
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

  Future register(AuthProvider authProvider, BuildContext context) async {
    authProvider.register().then(
          (value) => {
            if (value.isSuccess!)
              {
                Navigator.of(context).pushReplacementNamed("/confirm_sms"),
              }
            else
              {
                const CustomShowDialog().showDialog(context, "Uyarı", value.message ?? "Sms gönderilemedi."),
              }
          },
        );
  }
}
