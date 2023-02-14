import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_like_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';

class JobPostingListItem extends StatelessWidget {
  const JobPostingListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16,
                ),
                child: PlatformDefaultText(
                  text:
                      "İstanbul Beşiktaş'ta ÇOKKKK ACİLLLL Temizlikçi Arıyorum",
                  color: PlatformColorFoundation.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: PlatformTypographyFoundation.bodyLarge,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                  ),
                  child: PlatformLikeButton(
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: PlatformIconLabel(
            labelIconPath: "assets/icons/group.svg",
            labelText: "Ev Yardımcısı/Yatılı",
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 4,
          ),
          child: PlatformIconLabel(
            labelIconPath: "assets/icons/location.svg",
            labelText: "Kadıköy",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            children: const [
              PlatformDefaultText(
                text: "Son Giriş Tarihi : ",
                fontWeight: FontWeight.w400,
                fontSize: PlatformTypographyFoundation.bodyMedium,
                color: PlatformColorFoundation.textColor,
              ),
              PlatformDefaultText(
                text: "27.01.2023",
                fontWeight: FontWeight.w400,
                fontSize: PlatformTypographyFoundation.bodyMedium,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
