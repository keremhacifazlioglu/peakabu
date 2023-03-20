import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/applicant_provider.dart';
import 'package:platform/ui/atoms/platform_icon.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/organisms/recruiter/job_candidate/applicant_list.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ApplicantsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ApplicantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicantProvider>(
      create: (context) => ApplicantProvider(applicantRepository, secureLocalRepository, otherService, PageType.fetch),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor2,
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text("Aday Listesi"),
            ),
            actions: [
              GestureDetector(
                onTap: () async {
                  Navigator.of(context, rootNavigator: true).pushNamed("/applicant_filter_form");
                },
                child: const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 16,
                    ),
                    child: PlatformIcon(
                      width: PlatformDimensionFoundations.sizeXL,
                      height: PlatformDimensionFoundations.sizeXL,
                      color: Colors.black,
                      svgPath: "assets/icons/filter.svg",
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Consumer<ApplicantProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification) {
                      provider.fetchApplicantProfilesWithPagination();
                    }
                    return true;
                  },
                  child: ApplicantList(applicantProfiles: provider.allApplicantProfiles),
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
        );
      },
    );
  }
}
