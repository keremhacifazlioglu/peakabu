import 'package:flutter/material.dart';
import 'package:platform/providers/root_provider.dart';
import 'package:platform/ui/molecules/platform_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RootProvider>(
      builder: (c, s, w) => WillPopScope(
        onWillPop: () async {
          return !await s.navigatorState.currentState!.maybePop();
        },
        child: Scaffold(
          body: IndexedStack(
            index: s.currentIndex,
            children: s.pages,
          ),
          bottomNavigationBar: PlatformBottomNavBar(
            currentIndex: s.currentIndex,
            onTap: (p0) {
              if (p0 == s.currentIndex) {
                s.navigatorState.currentState!.maybePop();
              } else {
                s.setCurrentIndex(p0);
              }
            },
          ),
        ),
      ),
    );
  }
}
