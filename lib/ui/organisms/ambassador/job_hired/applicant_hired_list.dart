import 'package:flutter/material.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/ambassador/applicant_hired/applicant_hired_list_item.dart';

class ApplicantHiredList extends StatelessWidget {
  final List<JobRequest>? jobRequests;

  const ApplicantHiredList({
    Key? key,
    this.jobRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jobRequests!.length,
      itemBuilder: (context, index) {
        return ApplicantHiredListItem(
          jobRequest: jobRequests![index],
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
