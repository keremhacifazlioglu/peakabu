import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platform/ui/tokens/colors.dart';

class PlatformLikeButton extends StatelessWidget {
  final double? width, height;
  final bool? isLike;

  const PlatformLikeButton({Key? key, this.height, this.width, this.isLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(48),
        ),
        color: PlatformColor.primaryColor,
      ),
      child: Center(
        child: SvgPicture.asset(
          isLike != null && isLike! ? "assets/icons/star.svg" : "assets/icons/empty_star.svg",
          width: width! - 16,
          height: height! - 16,
          color: !isLike! ? PlatformColor.offWhiteColor : null,
        ),
      ),
    );
  }
}
