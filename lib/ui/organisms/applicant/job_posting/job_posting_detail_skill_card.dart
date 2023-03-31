import 'package:flutter/material.dart';
import 'package:peakabu/domain/response/job/job_detail.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/molecules/applicant/applicant_skill_item.dart';

class JobPostingDetailSkillCard extends StatelessWidget {
  final JobDetail? jobDetail;

  const JobPostingDetailSkillCard({
    Key? key,
    this.jobDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ApplicantSkillItem(
                  skillPlatformLabel: "Uyruk",
                  skillDescription: jobDetail!.nationality!,
                ),
                const Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Çalışma şekli",
                  skillDescription: jobDetail!.shiftSystem,
                ),
                const Divider(
                  color: PlatformColorFoundation.dividerColor,
                  thickness: 0.5,
                ),
                ApplicantSkillItem(
                  skillPlatformLabel: "Deneyim",
                  skillDescription: jobDetail!.experience,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
