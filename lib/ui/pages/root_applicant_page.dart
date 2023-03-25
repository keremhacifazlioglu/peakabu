import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/providers/root_provider.dart';
import 'package:platform/ui/molecules/platform_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RootApplicantPage extends StatelessWidget {
  const RootApplicantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RootProvider>(
      create: (context) => RootProvider(secureLocalRepository),
      builder: (context, child) {
        return Consumer<RootProvider>(
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
                      // Right Swipe
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: IndexedStack(
                  index: s.currentIndex,
                  children: s.pages,
                ),
              ),
              bottomNavigationBar: PlatformBottomNavBar(
                currentIndex: s.currentIndex,
                onTap: (p0){
                  s.checkToken().then(
                        (value) => {
                      if (value)
                        {
                          if (p0 == s.currentIndex)
                            {
                              s.navigatorState.currentState!.maybePop(),
                            }
                          else
                            {
                              s.setCurrentIndex(p0),
                            },
                          s.refreshPage(),
                        }
                      else
                        {
                          if (p0 != 0)
                            {
                              Navigator.of(context).pushNamed("/create_account"),
                            },
                          //s.setCurrentIndex(p0),
                        }
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
