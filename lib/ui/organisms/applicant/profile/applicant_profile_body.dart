import 'package:flutter/material.dart';
import 'package:platform/ui/molecules/applicant/profile/applicant_profile_description_card.dart';
import 'package:platform/ui/molecules/applicant/applicant_skill_item.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:platform/ui/tokens/sizes.dart';

class ApplicantProfileBody extends StatelessWidget {
  const ApplicantProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ApplicantProfileDescriptionCard(),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Container(
              height: 330,
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
                  children: const [
                    ApplicantSkillItem(
                      skillPlatformLabel: "Referanslar",
                      skillDescription: "2 referansı var",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Uyruk",
                      skillDescription: "Türkmenistan",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Çalışma şekli",
                      skillDescription: "Gündüzlü",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Deneyim",
                      skillDescription: "10+ yıl",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Sigara içiyor musunuz ?",
                      skillDescription: "Hayır",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Çocuğunuz var mı ?",
                      skillDescription: "Hayır",
                    ),
                    Divider(
                      color: PlatformColor.grayLightColor,
                      thickness: 0.5,
                    ),
                    ApplicantSkillItem(
                      skillPlatformLabel: "Seyehat engeliniz var mı ?",
                      skillDescription: "Hayır",
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
