import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/job_request/job_request_list_item.dart';

class JobRequestList extends StatelessWidget {
  final int? index;
  const JobRequestList({Key? key,this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 23, 12),
          child: JobRequestListItem(
            index: index,
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
