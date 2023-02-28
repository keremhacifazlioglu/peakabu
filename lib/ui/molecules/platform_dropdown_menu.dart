import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/atoms/platform_dropdown.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class CustomDropdownMenu extends StatelessWidget {
  final Map<String, String>? data;
  final String? selectedValue;
  final Function(String)? onChange;

  const CustomDropdownMenu({
    Key? key,
    this.data,
    this.onChange,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: PlatformColor.grayLightColor,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: PlatformDimension.sizeXS),
              child: PlatformDropdown(
                data: data!,
                selectedValue: selectedValue,
                onChange: (p0) => onChange!(p0),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(right: PlatformDimension.sizeSL),
              child: PlatformIcon(
                color: PlatformColor.grayLightColor,
                width: 15,
                height: 15,
                svgPath: "assets/icons/down_arrow.svg",
              ),
          ),
        ],
      ),
    );
  }
}
