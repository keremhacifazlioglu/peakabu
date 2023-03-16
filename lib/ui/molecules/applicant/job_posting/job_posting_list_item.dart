import 'package:flutter/material.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/providers/job_posting_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_like_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';
import 'package:provider/provider.dart';

class JobPostingListItem extends StatelessWidget {
  final JobPosting? jobPosting;


  const JobPostingListItem({
    Key? key,
    this.jobPosting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobPostingProvider = Provider.of<JobPostingProvider>(context);
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
                  text: jobPosting!.title!,
                  color: PlatformColorFoundation.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: PlatformTypographyFoundation.bodyLarge,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  if(jobPosting!.favorite!){
                    await jobPostingProvider.deleteFavoriteJob(jobPosting!);
                  }else{
                    await jobPostingProvider.addFavoriteJob(jobPosting!);
                  }
                }, //addFavoriteJobTap,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: PlatformLikeButton(
                      width: 36,
                      height: 36,
                      isLike: jobPosting!.favorite,
                    ),
                  ),
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
            labelText: "${jobPosting!.caretakerType!}/${jobPosting!.shiftSystem!}",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: PlatformIconLabel(
            labelIconPath: "assets/icons/location.svg",
            labelText: jobPosting!.district!,
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
                text: jobPosting!.createdAt,
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
