import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/storage/storage_item.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/atoms/platform_icon.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:peakabu/ui/tokens/sizes.dart';

class PlatformNationalityDropdownMenu extends StatefulWidget {
  final Map<String, String>? data;
  final String? text;

  const PlatformNationalityDropdownMenu({
    Key? key,
    this.data,
    this.text,
  }) : super(key: key);

  @override
  State<PlatformNationalityDropdownMenu> createState() => _PlatformNationalityDropdownMenuState();
}

class _PlatformNationalityDropdownMenuState extends State<PlatformNationalityDropdownMenu> {

  String selectedText = "";

  @override
  void initState() {
    getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: PlatformColor.grayLightColor,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed("/nationality", arguments: widget.data).then(
                        (value) => {
                      secureLocalRepository.writeSecureData(StorageItem("selectedNationalities", (value as String))),
                      setState(
                            () {
                          selectedText = value;
                        },
                      ),
                    },
                  );
                },
                child: PlatformDefaultText(
                  text: selectedText.isEmpty ? "Uyruk seçiniz" : selectedText,
                  color: PlatformColorFoundation.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: PlatformDimension.sizeSL),
            child: PlatformIcon(
              color: PlatformColor.grayLightColor,
              width: 15,
              height: 15,
              svgPath: "assets/icons/down_arrow.svg",
            ),
          ),
        ],
      ),
    );
  }

  Future getInitialData() async {
    String? value = await secureLocalRepository.readSecureData("selectedNationalities");
    setState(() {
      selectedText = value??"";
    });
  }
}
