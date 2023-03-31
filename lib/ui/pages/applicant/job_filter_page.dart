import 'package:flutter/material.dart';
import 'package:peakabu/config/locator.dart';
import 'package:peakabu/cons/page_type.dart';
import 'package:peakabu/network/network_status.dart';
import 'package:peakabu/providers/job_posting_provider.dart';
import 'package:peakabu/ui/organisms/applicant/job_posting/job_posting_list.dart';
import 'package:peakabu/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class JobFilterPage extends StatelessWidget {
  const JobFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobPostingProvider>(
      create: (context) =>
          JobPostingProvider(jobPostingRepository,secureLocalRepository,otherService,PageType.filter),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: PlatformColor.offWhiteColor2,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text("Filtrelenen İş ilanları"),
            ),
          ),
          body: Consumer<JobPostingProvider>(
            builder: (context, provider, child) {
              if (provider.networkStatus == NetworkStatus.success) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification) {
                      provider.fetchFilterJobPostingsWithPagination();
                    }
                    return true;
                  },
                  child: JobPostingList(jobPostings: provider.allFilterJobPosting),
                );
              }
              if (provider.networkStatus == NetworkStatus.error) {
                return const Center(
                  child: Text(""),
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
