import 'package:flutter/material.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/job_request/job_request_list_item.dart';

class JobRequestList extends StatelessWidget {
  final List<JobRequest>? jobRequests;

  const JobRequestList({
    Key? key,
    this.jobRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
