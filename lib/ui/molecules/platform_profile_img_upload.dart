import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/tokens/colors.dart';

class PlatformProfileImgUpload extends StatelessWidget {
  final bool? isFirst;

  const PlatformProfileImgUpload({
    Key? key,
    this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(80),
              ),
              color: PlatformColor.offWhiteColor2,
            ),
            child: (!isFirst!)
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(80),
                    ),
                    child: Image.network(
                      "https://i.mdel.net/i/db/2018/12/1034512/1034512-800w.jpg",
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: PlatformIcon(
                      height: 50,
                      width: 50,
                      svgPath: "assets/icons/camera.svg",
                      color: PlatformColor.grayLightColor,
                    ),
                  ),
          ),
        ),
        if (!isFirst!)
          Positioned(
            top: 110,
            left: 115,
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: PlatformColor.primaryColor,
              ),
              child: const Center(
                child: PlatformIcon(
                  height: 16,
                  width: 16,
                  color: PlatformColor.offWhiteColor,
                  svgPath: "assets/icons/profile_edit.svg",
                ),
              ),
            ),
          )
        else
          const Positioned(
            child: SizedBox(
              child: Text(""),
            ),
          ),
      ],
    );
  }
}
