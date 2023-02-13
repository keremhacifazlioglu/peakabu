import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';

class PlatformUnderText extends StatelessWidget {
  final String? text;

  const PlatformUnderText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: PlatformColorFoundation.textColor,
            decoration: TextDecoration.underline,
          ),
      textAlign: TextAlign.center,
    );
  }
}
