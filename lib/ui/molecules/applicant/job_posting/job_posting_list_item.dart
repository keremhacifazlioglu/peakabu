import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/domain/response/job/job_posting.dart';
import 'package:peakabu/providers/job_posting_provider.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/atoms/platform_like_button.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/typography.dart';
import 'package:peakabu/ui/molecules/platform_icon_label.dart';
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
                  secureLocalRepository.readSecureData("token").then(
                        (value) => {
                          if (value != null && value.isNotEmpty)
                            {
                              if (jobPosting!.favorite!)
                                {
                                  jobPostingProvider.deleteFavoriteJob(jobPosting!),
                                }
                              else
                                {
                                  jobPostingProvider.addFavoriteJob(jobPosting!),
                                }
                            }
                          else
                            {
                              Navigator.of(context, rootNavigator: true).pushNamed(
                                "/create_account",
                              ),
                            }
                        },
                      );
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
