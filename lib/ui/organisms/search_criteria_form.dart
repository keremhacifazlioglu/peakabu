import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/molecules/platform_dropdown_menu.dart';

class SearchCriteriaForm extends StatelessWidget {
  final String? text,selectedValue;
  final Map<String, String>? data;
  final Function(String)? onChange;

  const SearchCriteriaForm({
    Key? key,
    this.text,
    this.data,
    this.onChange,
    this.selectedValue,
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
          child: CustomDropdownMenu(
            data: data!,
            selectedValue: selectedValue,
            onChange: (p0) => onChange!(p0),
          ),
        ),
      ],
    );
  }
}
