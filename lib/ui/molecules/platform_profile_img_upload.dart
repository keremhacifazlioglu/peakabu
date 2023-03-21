import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/tokens/colors.dart';

class PlatformProfileImgUpload extends StatelessWidget {
  final bool? isFirst;
  final String? imageUrl;
  final Function()? onTap;
  final File? file;

  const PlatformProfileImgUpload({
    Key? key,
    this.isFirst,
    this.file,
    this.imageUrl,
    this.onTap,
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
                    child: file == null
                        ? Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          )
                        : Image.file(
                            file!,
                            fit: BoxFit.cover,
                          ),
                  )
                : file != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(80),
                        ),
                        child: Image.file(
                          file!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : GestureDetector(
                        onTap: onTap!,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: PlatformIcon(
                            svgPath: "assets/icons/camera.svg",
                            color: PlatformColor.grayLightColor,
                          ),
                        ),
                      ),
          ),
        ),
        if (!isFirst!)
          Positioned(
            top: 110,
            left: 115,
            child: GestureDetector(
              onTap: onTap!,
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
