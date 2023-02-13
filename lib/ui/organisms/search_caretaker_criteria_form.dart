import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_label.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/molecules/platform_dropdown_menu.dart';

class SearchCaretakerCriteriaForm extends StatelessWidget {
  final String? text;
  final Map<String, String>? data;
  final Function(String)? onChange;

  const SearchCaretakerCriteriaForm({
    Key? key,
    this.text,
    this.data,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlatformLabel(
          text: text,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(PlatformDimensionFoundations.sizeXL, 0, PlatformDimensionFoundations.sizeXL, 0),
          child: CustomDropdownMenu(
            data: data!,
            onChange: (p0) => onChange!(p0),
          ),
        ),
      ],
    );
  }
}
