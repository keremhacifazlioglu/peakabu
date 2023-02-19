import 'package:flutter/material.dart';
import 'package:platform/ui/molecules/platform_gender_button.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ChooseGenderRow extends StatelessWidget {
  final Function(String)? onTap;
  final bool? onSelected;

  const ChooseGenderRow({
    Key? key,
    this.onTap,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: PlatformDimension.sizeXL),
          child: GestureDetector(
            onTap: onTap!("1"),
            child: PlatformGenderButton(
              selectedColor: onSelected! ? PlatformColor.primaryColor : PlatformColor.grayLightColor ,
              text: "Kadın",
              width: (MediaQuery.of(context).size.width - 48) / 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: PlatformDimension.sizeXL),
          child: GestureDetector(
            onTap: onTap!("2"),
            child: PlatformGenderButton(
              selectedColor: !onSelected! ? PlatformColor.primaryColor : PlatformColor.grayLightColor,
              text: "Erkek",
              width: (MediaQuery.of(context).size.width - 48) / 2,
            ),
          ),
        ),
      ],
    );
  }
}
