import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/splash_provider.dart';
import 'package:platform/ui/organisms/custom_show_dialog.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(secureLocalRepository, authRepository),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: PlatformColor.primaryColor,
          body: Consumer<SplashProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.of(context).pushReplacementNamed("redirect");
                  },
                );
              }
              if (provider.networkStatus == NetworkStatus.error) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  const CustomShowDialog()
                      .showDialog(context, "Hata", "Teknik bir arıza sebbiyle hizmet verememekteyiz");
                });
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/peakabu.svg",
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
