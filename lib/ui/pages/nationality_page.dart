import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';

class NationalityPage extends StatefulWidget {
  final Map<String, String>? data;

  const NationalityPage({Key? key, this.data}) : super(key: key);

  @override
  State<NationalityPage> createState() => _NationalityPageState();
}

class _NationalityPageState extends State<NationalityPage> {
  Map<String, bool> selectedMap = {};
  String text = "";

  @override
  void initState() {
    secureLocalRepository.readSecureData("selectedNationalities").then((value) => {
          text = value??"",
          prepareCheckBox(),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Uyruk seçiniz"),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(text);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: ListView.separated(
        addAutomaticKeepAlives: true,
        itemBuilder: (context, index) {
          var list = widget.data!.values.toList();
          return Row(
            children: [
              Checkbox(
                value: selectedMap[list[index]] ?? false,
                onChanged: (value) {
                  selectedMap[list[index]] = value!;
                  text = prepareSelectedText();
                  setState(() {});
                },
              ),
              PlatformDefaultText(
                color: PlatformColorFoundation.textColor,
                text: list[index],
                fontSize: PlatformTypographyFoundation.bodyMedium,
                fontWeight: FontWeight.w400,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            color: PlatformColorFoundation.dividerColor,
          );
        },
        itemCount: widget.data!.length,
      ),
    );
  }

  String prepareSelectedText() {
    String text = "";
    selectedMap.forEach((key, value) {
      if (value) {
        text += "$key,";
      }
    });
    return text;
  }

  Future prepareCheckBox() async {
    List<String> selectedList = text.split(",");
    for (String element in selectedList) {
      if (element.isNotEmpty) {
        selectedMap[element] = true;
      }
    }
    setState(() {

    });
  }
}
