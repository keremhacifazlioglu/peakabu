import 'package:flutter/material.dart';
import 'package:peakabu/domain/response/job/job_detail.dart';
import 'package:peakabu/ui/foundations/colors.dart';
import 'package:peakabu/ui/molecules/recruiter/job_candidate/job_posting_list_item.dart';
import 'package:peakabu/ui/molecules/applicant/job_posting/job_posting_detail_description_item.dart';

class MyJobPostingDetailCard extends StatelessWidget {
  final JobDetail? jobDetail;

  const MyJobPostingDetailCard({
    Key? key,
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
                  jobDetail: jobDetail!,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 1,
                  color: PlatformColorFoundation.dividerColor,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: JobPostingDetailDescriptionItem(
                  jobPostingDescription: jobDetail!.desc!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
