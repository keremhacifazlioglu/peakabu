import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/tokens/typography.dart';

class PlatformTextFormInput extends StatelessWidget {
  final String? labelText;

  const PlatformTextFormInput({
    Key? key,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        PlatformDimensionFoundations.sizeXL,
        PlatformDimensionFoundations.sizeXXS,
        PlatformDimensionFoundations.sizeXL,
        PlatformDimensionFoundations.sizeXXS,
      ),
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.only(
              left: PlatformDimensionFoundations.sizeXS,
            ),
            child: Text(labelText!),
          ),
          labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: PlatformTypography.sizeSL,
              ),
          prefix: const SizedBox(
            width: PlatformDimensionFoundations.sizeLG,
          ),
        ),
      ),
    );
  }
}
