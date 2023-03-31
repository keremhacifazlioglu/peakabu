import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/network/network_status.dart';
import 'package:peakabu/providers/splash_provider.dart';
import 'package:peakabu/ui/organisms/custom_show_dialog.dart';
import 'package:peakabu/ui/tokens/colors.dart';
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
                    provider.getUserType().then(
                          (value) => {
                            if (value.isEmpty)
                              {
                                Navigator.of(context).pushReplacementNamed("redirect"),
                              }
                            else if (value == "applicant")
                              {
                                Navigator.of(context).pushReplacementNamed("/applicant").then(
                                      (value) => {
                                        exit(0),
                                      },
                                    )
                              }
                            else if (value == "recruiter")
                              {
                                Navigator.of(context).pushReplacementNamed("/recruiter").then(
                                      (value) => {
                                        exit(0),
                                      },
                                    ),
                              }
                          },
                        );
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
