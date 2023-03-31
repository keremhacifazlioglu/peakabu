import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_icon.dart';
import 'package:peakabu/ui/tokens/colors.dart';

class PlatformBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onTap;

  const PlatformBottomNavBar({
    Key? key,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex!,
      onTap: (v) {
        onTap!(v);
      },
      elevation: 2,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: PlatformIcon(
            svgPath: "assets/icons/home.svg",
            height: 30,
            width: 30,
            color: PlatformColor.grayLightColor,
          ),
          label: 'Home',
          activeIcon: PlatformIcon(
            svgPath: "assets/icons/home.svg",
            height: 30,
            width: 30,
            color: PlatformColor.primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: PlatformIcon(
            svgPath: "assets/icons/empty_star.svg",
            height: 30,
            width: 30,
            color: PlatformColor.grayLightColor,
          ),
          label: 'Follow',
          activeIcon: PlatformIcon(
            svgPath: "assets/icons/empty_star.svg",
            height: 30,
            width: 30,
            color: PlatformColor.primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: PlatformIcon(
            svgPath: "assets/icons/bell.svg",
            height: 30,
            width: 30,
            color: PlatformColor.grayLightColor,
          ),
          label: 'Notification',
          activeIcon: PlatformIcon(
            svgPath: "assets/icons/bell.svg",
            height: 30,
            width: 30,
            color: PlatformColor.primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: PlatformIcon(
            svgPath: "assets/icons/user.svg",
            height: 30,
            width: 30,
            color: PlatformColor.grayLightColor,
          ),
          label: 'Profile',
          activeIcon: PlatformIcon(
            svgPath: "assets/icons/user.svg",
            height: 30,
            width: 30,
            color: PlatformColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
