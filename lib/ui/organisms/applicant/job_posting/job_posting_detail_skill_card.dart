import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/applicant_skill_item.dart';

class JobPostingDetailSkillCard extends StatelessWidget {
  const JobPostingDetailSkillCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ApplicantSkillItem(
                  skillPlatformLabel: "Referanslar",
                  skillDescription: "2 referansı var",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Uyruk",
                  skillDescription: "Türkmenistan",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Çalışma şekli",
                  skillDescription: "Gündüzlü",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Deneyim",
                  skillDescription: "10+ yıl",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Sigara içiyor musunuz ?",
                  skillDescription: "Hayır",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Çocuğunuz var mı ?",
                  skillDescription: "Hayır",
                ),
                Divider(
                  color: PlatformColorFoundation.dividerColor,
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
      ),
    );
  }
}
