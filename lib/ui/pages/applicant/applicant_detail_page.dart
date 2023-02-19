import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_submit_button.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_body.dart';
import 'package:platform/ui/organisms/applicant/profile/applicant_profile_header.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ApplicantDetailPage extends StatelessWidget {
  const ApplicantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
        create: (context) => ApplicantProvider(applicantRepository),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Profilim"),
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
                          children:  [
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
                    child: Text("Uyarı çıakrtılacak."),
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
                  buttonText: "Düzenle",
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed("/applicant_profile");
                  },
                ),
              ),
            ),
          );
        });
  }
}
