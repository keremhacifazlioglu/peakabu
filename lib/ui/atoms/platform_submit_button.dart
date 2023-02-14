import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class PlatformSubmitButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onPressed;

  const PlatformSubmitButton({
    Key? key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              PlatformColorFoundation.buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: PlatformColor.offWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: PlatformTypographyFoundation.bodyLarge),
        ),
      ),
    );
  }
}
