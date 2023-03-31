import 'package:flutter/material.dart';
import 'package:peakabu/ui/atoms/platform_label.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/tokens/colors.dart';

class PlatformMultilineText extends StatelessWidget {
  const PlatformMultilineText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlatformLabel(
          text: "Açıklama",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PlatformDimensionFoundations.sizeXL, vertical: 4),
          child: Container(
            color: Colors.white,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter Remarks",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: PlatformColor.grayLightColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
