import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/job_posting_provider.dart';
import 'package:platform/ui/organisms/applicant/job_posting/job_posting_list.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class JobFollowPage extends StatelessWidget {
  const JobFollowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobPostingProvider>(
      create: (context) =>
          JobPostingProvider(jobPostingRepository, PageType.fetch),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor2,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text("Takip ettiklerim"),
            ),
          ),
          body: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification) {
                      provider.fetchFavoriteJobPostingsWithPagination();
                    }
                    return true;
                  },
                  child: JobPostingList(
                      jobPostings: provider.allFavoriteJobPosting),
                );
              }
              if (provider.networkStatus == NetworkStatus.error) {
                return const Center(
                  child: Text("Uyarı çıakrtılacak."),
                );
              }
              return const Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    color: PlatformColor.primaryColor,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
