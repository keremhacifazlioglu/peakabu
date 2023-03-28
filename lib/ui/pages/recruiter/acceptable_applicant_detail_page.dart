import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_default_text.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_body.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_header.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Todo Bu sayfa kaldırılmak üzere yazılmıştır.
class AcceptableApplicantDetailPage extends StatelessWidget {
  const AcceptableApplicantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
      create: (context) => ApplicantProvider(applicantRepository, secureLocalRepository, otherService, PageType.detail),
      builder: (context, child) {
        var applicantProvider = Provider.of<ApplicantProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Aday Profili"),
            centerTitle: true,
          ),
          body: Consumer<ApplicantProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return ListView(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 1100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: ApplicantDetailHeader(applicantProfile: provider.applicantProfile),
                          ),
                          Positioned(
                            top: 590,
                            left: 27,
                            right: 27,
                            child: ApplicantProfileBody(applicantProfile: provider.applicantProfile),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                buttonText: "İletişim bilgilerini gör",
                onPressed: () {
                  applicantProvider.fetchApplicantPhone(applicantProvider.applicantProfile!.id!).then(
                        (value) => {
                      showGetPhoneDialog(context, value.phone!),
                    },
                  );
                },
              ),
            ),
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
                text: "Aday İletişim Bilgileri",
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
