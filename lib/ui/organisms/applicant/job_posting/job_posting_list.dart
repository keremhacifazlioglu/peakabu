import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/storage/storage_item.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/applicant/job_posting/job_posting_list_item.dart';
import 'package:platform/ui/tokens/colors.dart';

class JobPostingList extends StatelessWidget {
  final List<JobPosting>? jobPostings;

  const JobPostingList({
    Key? key,
    this.jobPostings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey<String>("JobPosting"),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            secureLocalRepository.readSecureData("token").then(
                  (value) => {
                    if (value != null && value.isNotEmpty)
                      {
                        secureLocalRepository.writeSecureData(StorageItem("jobPostingId", jobPostings![index].id.toString())),
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          "/job_posting_detail",
                          arguments: jobPostings![index],
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
            width: double.infinity,
            height: 145,
            color: PlatformColor.offWhiteColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, bottom: 16),
              child: JobPostingListItem(jobPosting: jobPostings![index]),
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
      itemCount: jobPostings != null ? jobPostings!.length : 0,
    );
  }
}
