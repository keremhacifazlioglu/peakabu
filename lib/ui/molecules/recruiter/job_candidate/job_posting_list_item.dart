import 'package:flutter/material.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';

class JobPostingListItem extends StatelessWidget {
  final JobDetail? jobDetail;


  const JobPostingListItem({
    Key? key,
    this.jobDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: PlatformDefaultText(
                  text: jobDetail!.title!,
                  color: PlatformColorFoundation.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: PlatformTypographyFoundation.bodyLarge,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: PlatformIconLabel(
            labelIconPath: "assets/icons/group.svg",
            labelText: "${jobDetail!.caretakerType!}/${jobDetail!.shiftSystem??""}",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: PlatformIconLabel(
            labelIconPath: "assets/icons/location.svg",
            labelText: jobDetail!.district!,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            children: [
              const PlatformDefaultText(
                text: "Son Giriş Tarihi : ",
                fontWeight: FontWeight.w400,
                fontSize: PlatformTypographyFoundation.bodyMedium,
                color: PlatformColorFoundation.textColor,
              ),
              PlatformDefaultText(
                text: jobDetail!.createdAt,
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
