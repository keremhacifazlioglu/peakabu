import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_like_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/molecules/platform_icon_label.dart';
import 'package:provider/provider.dart';

class ApplicantListItem extends StatelessWidget {
  final ApplicantProfile? applicantProfile;

  const ApplicantListItem({
    Key? key,
    this.applicantProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var applicantProvider = Provider.of<ApplicantProvider>(context);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 16, left: 20, bottom: 15),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Image.network(
                applicantProfile!.image ?? "https://i.mdel.net/i/db/2018/12/1034512/1034512-800w.jpg",
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
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
                        text: applicantProfile!.name!,
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
                                    if (applicantProfile!.favorite!)
                                      {
                                        applicantProvider.deleteFavoriteApplicant(applicantProfile),
                                      }
                                    else
                                      {
                                        applicantProvider.addFavoriteApplicant(applicantProfile!),
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
                          padding: const EdgeInsets.only(top: 16, right: 12),
                          child: PlatformLikeButton(
                            width: 36,
                            height: 36,
                            isLike: applicantProfile!.favorite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              PlatformIconLabel(
                labelIconPath: "assets/icons/group.svg",
                labelText: "${applicantProfile!.caretakerType!}/${applicantProfile!.shiftSystem!}",
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: PlatformIconLabel(
                  labelIconPath: "assets/icons/location.svg",
                  labelText: applicantProfile!.district!,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
