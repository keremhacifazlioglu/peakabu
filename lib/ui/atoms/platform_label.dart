import 'package:flutter/material.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/tokens/typography.dart';

class PlatformLabel extends StatelessWidget {
  final String? text;

  const PlatformLabel({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        PlatformTypography.sizeXL,
        PlatformTypography.sizeSL,
        PlatformTypography.sizeXL,
        PlatformTypography.sizeXXS,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 20,
        child: Text(
          text!,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: PlatformTypography.sizeSM,
                fontWeight: FontWeight.w600,
                color: PlatformColorFoundation.textColor,
              ),
        ),
      ),
    );
  }
}
