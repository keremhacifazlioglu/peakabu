import 'package:flutter/material.dart';
import 'package:peakabu/domain/response/job/job_posting.dart';
import 'package:peakabu/domain/response/job/job_request.dart';
import 'package:peakabu/providers/job_requests_provider.dart';
import 'package:peakabu/ui/atoms/platform_cancel_button.dart';
import 'package:peakabu/ui/atoms/platform_default_text.dart';
import 'package:peakabu/ui/atoms/platform_submit_button.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/foundations/sizes.dart';
import 'package:peakabu/ui/molecules/applicant/job_request/job_request_list_item.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class JobRequestList extends StatelessWidget {
  final List<JobRequest>? jobRequests;

  const JobRequestList({
    Key? key,
    this.jobRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobRequestProvider = Provider.of<JobRequestsProvider>(context);
    return ListView.separated(
      key: const PageStorageKey<String>("JobRequestList"),
      addAutomaticKeepAlives: true,
      itemCount: jobRequests!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 23, 12),
          child: GestureDetector(
            onTap: () {
              if (jobRequests![index].requestStatus == "accepted") {
                Navigator.of(context, rootNavigator: true).pushNamed("/acceptable_job_posting_detail",
                    arguments: JobPosting.fromJson(jobRequests![index].toJson()));
              } else if(jobRequests![index].requestStatus == "pending" && jobRequestProvider.isSelectedHireJob){
                showConfirmRequestDialog(context, jobRequestProvider, jobRequests![index]);
              }
            },
            child: JobRequestListItem(
              jobRequest: jobRequests![index],
            ),
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

  void showConfirmRequestDialog(BuildContext context, JobRequestsProvider jobRequestsProvider, JobRequest jobRequest) {
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
                text: "İş ilanı için iletişim talebi aldınız.",
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
                  text: "İletişim talebini kabul ediyor musunuz ?",
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
                    width: (MediaQuery.of(context).size.width - 32) / 2,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(27, 16, 8, 8),
                      child: PlatformSubmitButton(
                        buttonText: "Kabul Et",
                        onPressed: () {
                          jobRequestsProvider.applyJobRequest(jobRequest.id!).then((value) => {
                                Navigator.of(context).pop(),
                              });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 32) / 2,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 27, 8),
                      child: PlatformCancelButton(
                        buttonText: "Reddet",
                        onPressed: () {
                          jobRequestsProvider.rejectJobRequest(jobRequest.id!).then((value) => {
                                Navigator.of(context).pop(),
                              });
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
