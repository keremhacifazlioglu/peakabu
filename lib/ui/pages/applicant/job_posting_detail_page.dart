import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:url_launcher/url_launcher.dart';

class JobPostingDetailPage extends StatelessWidget {
  final JobPosting? jobPosting;
  final bool? isAccepted;

  const JobPostingDetailPage({Key? key, this.jobPosting, this.isAccepted}) : super(key: key);

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
              if (provider.networkStatus == NetworkStatus.success && provider.jobDetail != null) {
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
                  child: Text(""),
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
                    buttonText: isAccepted! ? "İletişim Bilgilerini Gör" : "Başvur",
                    onPressed: () {
                      if (!isAccepted!) {
                        provider.confirmJobPosting().then(
                              (value) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: PlatformDefaultText(
                                      text: value.isSuccess! ? 'Talep iletilmiştir' : value.message,
                                      color: PlatformColor.offWhiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              },
                            );
                      } else {
                        provider.fetchJobPostingPhone(provider.jobDetail!.id!).then(
                              (value) => {
                                showGetPhoneDialog(context, value.phone!),
                              },
                            );
                      }
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

  void showGetPhoneDialog(BuildContext context, String phoneNumber) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: PlatformColor.offWhiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const PlatformDefaultText(
                text: "İlan Sahibi İletişim Bilgileri",
                maxLine: 2,
                fontWeight: FontWeight.w600,
                fontSize: PlatformDimensionFoundations.sizeMD,
                color: PlatformColor.offBlackColor,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Divider(
                  thickness: 0.5,
                  color: PlatformColor.grayLightColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 8, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/icon_mobile.svg"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: PlatformDefaultText(
                        text: phoneNumber,
                        maxLine: 1,
                        fontWeight: FontWeight.w400,
                        fontSize: PlatformDimensionFoundations.sizeMD,
                        color: PlatformColor.offBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
                child: PlatformSubmitButton(
                  buttonText: "Şimdi Ara",
                  onPressed: () {
                    launch("tel://$phoneNumber");
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
