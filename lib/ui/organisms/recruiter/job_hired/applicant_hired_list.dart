import 'package:flutter/material.dart';
import 'package:peakabu/domain/response/applicant_requests/applicant_request.dart';
import 'package:peakabu/providers/applicant_hired_provider.dart';
import 'package:peakabu/ui/atoms/platform_cancel_button.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/atoms/platform_submit_button.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/molecules/recruiter/applicant_hired/applicant_hired_list_item.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class ApplicantHiredList extends StatelessWidget {
  final List<ApplicantRequest>? applicantRequests;

  const ApplicantHiredList({
    Key? key,
    this.applicantRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var applicantHiredProvider = Provider.of<ApplicantHiredProvider>(context);
    return ListView.separated(
      itemCount: applicantRequests!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (applicantRequests![index].requestStatus == "accepted") {
              Navigator.of(context, rootNavigator: true).pushNamed("/acceptable_applicant_detail");
            } else if (applicantRequests![index].requestStatus == "pending" &&
                applicantHiredProvider.isSelectedFindJob) {
              showConfirmApplicantDialog(context, applicantHiredProvider, applicantRequests![index]);
            }
          },
          child: ApplicantHiredListItem(
            applicantRequest: applicantRequests![index],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          color: PlatformColorFoundation.dividerColor,
        );
      },
    );
  }

  Future showConfirmApplicantDialog(BuildContext context, ApplicantHiredProvider applicantHiredProvider,
      ApplicantRequest applicantRequest) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180,
          color: PlatformColor.offWhiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const PlatformDefaultText(
                text: "Bir aday iş ilanınız için başvuruda bulundu.",
                maxLine: 2,
                fontWeight: FontWeight.w600,
                fontSize: PlatformDimensionFoundations.sizeMD,
                color: PlatformColor.offBlackColor,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 12,
                ),
                child: PlatformDefaultText(
                  text: "Adayın iletişim talebini kabul ediyor musunuz?",
                  maxLine: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: PlatformDimensionFoundations.sizeMD,
                  color: PlatformColor.offBlackColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: (MediaQuery
                        .of(context)
                        .size
                        .width - 32) / 2,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(27, 16, 8, 8),
                      child: PlatformSubmitButton(
                        buttonText: "Kabul Et",
                        onPressed: () async {
                          await applicantHiredProvider.applyHiredRequest(applicantRequest.id!);
                          await applicantHiredProvider.fetchHireApplicantWithPagination().then((value) => {
                          Navigator.of(context).pop(),
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery
                        .of(context)
                        .size
                        .width - 32) / 2,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 27, 8),
                      child: PlatformCancelButton(
                        buttonText: "Reddet",
                        onPressed: () {
                          applicantHiredProvider.rejectHiredRequest(applicantRequest.id!).then(
                                (value) =>
                            {
                              Navigator.of(context).pop(),
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
