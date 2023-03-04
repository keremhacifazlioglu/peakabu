import 'package:flutter/material.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/ambassador/applicant_hired/applicant_hired_list_item.dart';

class ApplicantHiredList extends StatelessWidget {
  final List<ApplicantRequest>? applicantRequests;

  const ApplicantHiredList({
    Key? key,
    this.applicantRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: applicantRequests!.length,
      itemBuilder: (context, index) {
        return ApplicantHiredListItem(
          applicantRequest: applicantRequests![index],
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
