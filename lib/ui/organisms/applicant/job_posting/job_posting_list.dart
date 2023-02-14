import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/job_posting/job_posting_list_item.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobPostingList extends StatelessWidget {
  const JobPostingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed("/create_account");
          },
          child: Container(
            width: double.infinity,
            height: 145,
            color: PlatformColor.offWhiteColor,
            child: const Padding(
              padding: EdgeInsets.only(left: 28, bottom: 16),
              child: JobPostingListItem(),
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
      itemCount: 3,
    );
  }
}
