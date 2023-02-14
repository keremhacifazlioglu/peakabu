import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

class PlatformCancelButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onPressed;

  const PlatformCancelButton({
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
          backgroundColor:
              MaterialStateProperty.all<Color>(PlatformColor.offWhiteColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(PlatformColor.offWhiteColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              side: const BorderSide(color: PlatformColor.offBlackColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: PlatformColor.offBlackColor,
              fontWeight: FontWeight.w600,
              fontSize: PlatformTypographyFoundation.bodyLarge),
        ),
      ),
    );
  }
}
