import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/recruiter/job_candidate/applicant_list_item.dart';
import 'package:platform/ui/tokens/colors.dart';

class ApplicantList extends StatelessWidget {
  final List<ApplicantProfile>? applicantProfiles;

  const ApplicantList({
    Key? key,
    this.applicantProfiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey<String>("ApplicantJobPosting"),
      addAutomaticKeepAlives: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            secureLocalRepository.readSecureData("token").then(
                  (value) => {
                    if (value != null && value.isNotEmpty)
                      {
                        secureLocalRepository.writeSecureData(StorageItem("applicantId", applicantProfiles![index].id!.toString())),
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          "/applicant_detail",
                        ),
                      }
                    else
                      {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          "/create_account",
                        ),
                      }
                  },
                );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 115,
            color: PlatformColor.offWhiteColor,
            child: ApplicantListItem(
              applicantProfile: applicantProfiles![index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
          color: PlatformColorFoundation.dividerColor,
        );
      },
      itemCount: applicantProfiles != null ? applicantProfiles!.length : 0,
    );
  }
}
