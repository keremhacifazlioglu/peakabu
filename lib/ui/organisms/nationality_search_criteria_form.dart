import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_label.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/molecules/platform_dropdown_menu.dart';
import 'package:peakabu/ui/molecules/platform_nationality_dropdown_menu.dart';

class NationalitySearchCriteriaForm extends StatelessWidget {
  final String? text;
  final Map<String, String>? data;

  const NationalitySearchCriteriaForm({
    Key? key,
    this.text,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlatformLabel(
          text: text,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            PlatformDimensionFoundations.sizeXL,
            0,
            PlatformDimensionFoundations.sizeXL,
            0,
          ),
          child: PlatformNationalityDropdownMenu(
            data: data!,
          ),
        ),
      ],
    );
  }
}
