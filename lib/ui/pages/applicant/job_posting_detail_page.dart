import 'package:flutter/material.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_detail_card.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_detail_skill_card.dart';
import 'package:platform/ui/organisms/custom_alert_dialog.dart';

class JobPostingDetailPage extends StatelessWidget {
  const JobPostingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const PlatformDefaultText(
          text: "İlan Detayı",
          color: PlatformColorFoundation.textColor,
          fontWeight: FontWeight.w600,
          fontSize: PlatformTypographyFoundation.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            JobPostingDetailCard(),
            JobPostingDetailSkillCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            PlatformDimensionFoundations.sizeXXL,
            PlatformDimensionFoundations.sizeXL,
            PlatformDimensionFoundations.sizeXXL,
            PlatformDimensionFoundations.sizeXL,
          ),
          child: PlatformSubmitButton(
            buttonText: "Başvur",
            onPressed: () {
             const  CustomAlertDialog().showDialog(context, "Değişiklikleri kaydetmek istediğinizden emin misiniz?");
            },
          ),
        ),
      ),
    );
  }
}
