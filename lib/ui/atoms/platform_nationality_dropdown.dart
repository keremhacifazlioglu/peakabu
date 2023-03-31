import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/typography.dart';
import 'package:peakabu/ui/tokens/sizes.dart';

class PlatformNationalityDropdown extends StatelessWidget {
  final Map<String, String>? data;
  final Function(String)? onChange;
  final String? selectedValue;

  const PlatformNationalityDropdown({Key? key, this.data,this.selectedValue, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      value: selectedValue,
      icon: const SizedBox(),
      items: data!
          .map(
            (key, value) {
              return MapEntry(
                key,
                DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 200,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: PlatformDimension.sizeXS),
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {
                            },
                          ),
                          PlatformDefaultText(
                            color: PlatformColorFoundation.textColor,
                            text: value,
                            fontSize: PlatformTypographyFoundation.bodyMedium,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              );
            },
          )
          .values
          .toList(),
      onChanged: (value) {
        onChange!(value!);
      },
    );
  }
}
