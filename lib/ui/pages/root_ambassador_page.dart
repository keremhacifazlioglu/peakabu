import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peakabu/providers/root_ambassador_provider.dart';
import 'package:peakabu/ui/molecules/platform_ambassador_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../config/locator.dart';

class RootAmbassadorPage extends StatelessWidget {
  const RootAmbassadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RootAmbassadorProvider>(
      create: (context) => RootAmbassadorProvider(secureLocalRepository),
      builder: (context, child) {
        return Consumer<RootAmbassadorProvider>(
          builder: (c, s, w) => WillPopScope(
            onWillPop: () async {
              return !await s.navigatorState.currentState!.maybePop();
            },
            child: Scaffold(
              body: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (Platform.isIOS) {
                    int sensitivity = 8;
                    if (details.delta.dx > sensitivity) {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: IndexedStack(
                  index: s.currentIndex,
                  children: s.pages,
                ),
              ),
              bottomNavigationBar: PlatformAmbassadorBottomNavBar(
                currentIndex: s.currentIndex,
                onTap: (p0) {
                  if (p0 == s.currentIndex) {
                    s.navigatorState.currentState!.maybePop();
                  } else {
                    s.setCurrentIndex(p0);
                  }
                  s.refreshPage();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
