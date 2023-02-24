import 'package:flutter/material.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/job_posting/job_posting_detail_description_item.dart';
import 'package:platform/ui/molecules/applicant/job_posting/job_posting_list_item.dart';

class JobPostingDetailCard extends StatelessWidget {
  final JobPosting? jobPosting;
  final JobDetail? jobDetail;

  const JobPostingDetailCard({
    Key? key,
    this.jobPosting,
    this.jobDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            side: BorderSide(
              color: PlatformColorFoundation.dividerColor,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 16),
                child: JobPostingListItem(
                  //addFavoriteJobTap: addFavoriteJobTap,
                  jobPosting: jobPosting!,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 1,
                  color: PlatformColorFoundation.dividerColor,
                ),
              ),
              JobPostingDetailDescriptionItem(
                jobPostingDescription: jobDetail!.desc!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
