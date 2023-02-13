import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';

class JobRequestListItem extends StatelessWidget {
  final int? index;
  const JobRequestListItem({Key? key,this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 64,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: PlatformDefaultText(
                    text: "İstanbul Beşiktaş'ta ÇOKKKK ACİLLLL Temizlikçi Arıyorum",
                    color: PlatformColorFoundation.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: PlatformTypographyFoundation.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: PlatformIconLabel(
                        labelIconPath: "assets/icons/group.svg",
                        labelText: "Ev Yardımcısı/Yatılı",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: PlatformIconLabel(
                        labelIconPath: "assets/icons/location.svg",
                        labelText: "Kadıköy",
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 125,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: index! % 2 == 0
                      ? const Color.fromRGBO(54, 120, 253, 0.15)
                      : const Color.fromRGBO(14, 191, 119, 0.15),
                ),
                child: Center(
                  child: PlatformDefaultText(
                    text: "Başvuru Gönderildi",
                    color: index! % 2 == 0 ? Colors.blue : Colors.green,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
