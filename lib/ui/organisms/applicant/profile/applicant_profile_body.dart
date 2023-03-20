import 'package:flutter/material.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/ui/molecules/applicant/applicant_skill_item.dart';
import 'package:platform/ui/molecules/applicant/profile/applicant_profile_description_card.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ApplicantProfileBody extends StatelessWidget {
  final ApplicantProfile? applicantProfile;

  const ApplicantProfileBody({
    Key? key,
    this.applicantProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ApplicantProfileDescriptionCard(
              desc: applicantProfile!.desc??"",
              descTitle: applicantProfile!.title??"",
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(PlatformDimension.sizeXS),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(PlatformDimension.sizeLG),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ApplicantSkillItem(
                      skillPlatformLabel: "Uyruk",
                      skillDescription: applicantProfile!.district!,
                    ),
                    const Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Çalışma şekli",
                      skillDescription: applicantProfile!.shiftSystem!,
                    ),
                    const Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Deneyim",
                      skillDescription: applicantProfile!.experience!,
                    ),
                    const Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Yaş",
                      skillDescription: applicantProfile!.age!,
                    ),
                    const Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Yardımcı türü",
                      skillDescription: applicantProfile!.caretakerType!,
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
