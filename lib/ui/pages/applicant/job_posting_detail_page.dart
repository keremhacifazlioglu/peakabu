import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/job_posting_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_detail_card.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_detail_skill_card.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class JobPostingDetailPage extends StatelessWidget {
  final JobPosting? jobPosting;

  const JobPostingDetailPage({
    Key? key,
    this.jobPosting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobPostingProvider>(
      create: (context) =>
          JobPostingProvider(jobPostingRepository, secureLocalRepository, otherService, PageType.detail),
      builder: (context, child) {
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
          body: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      JobPostingDetailCard(
                        jobDetail: provider.jobDetail,
                        jobPosting: jobPosting,
                      ),
                      JobPostingDetailSkillCard(jobDetail: provider.jobDetail),
                    ],
                  ),
                );
              }
              if (provider.networkStatus == NetworkStatus.error) {
                return const Center(
                  child: Text("Uyarı çıkartılacak."),
                );
              }
              return const Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    color: PlatformColor.primaryColor,
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              return Container(
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
                      provider.applyJobPosting().then(
                            (value) => {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: PlatformDefaultText(
                                  text: value.isSuccess! ? 'Talep iletilmiştir' : value.message,
                                  color: PlatformColor.offWhiteColor,
                                  fontSize: 14,
                                )),
                              ),
                            },
                          );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
