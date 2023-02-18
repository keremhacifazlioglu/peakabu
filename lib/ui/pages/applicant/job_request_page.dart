import 'package:flutter/material.dart';
import 'package:platform/config/locator.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/providers/job_requests_provider.dart';
import 'package:platform/ui/foundations/colors.dart';
import 'package:platform/ui/molecules/platform_tab_menu.dart';
import 'package:platform/ui/organisms/applicant/job_request/job_request_list.dart';
import 'package:platform/ui/tokens/colors.dart';
import 'package:provider/provider.dart';

class JobRequestPage extends StatelessWidget {
  const JobRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JobRequestsProvider>(
      create: (context) => JobRequestsProvider(jobPostingRepository, PageType.fetch),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("İş Başvurularım"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: PlatformColor.offWhiteColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(27, 20, 27, 20),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 60) / 2,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: PlatformColor.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Consumer<JobRequestsProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: GestureDetector(
                                  onTap: () async {
                                    await provider.selectedFindJob();
                                    await provider.fetchFindJobPostingsWithPagination();
                                  },
                                  child: PlatformTabMenu(
                                    width: (MediaQuery.of(context).size.width - 64) / 2,
                                    color: provider.isSelectedFindJob ? PlatformColor.primaryColor : PlatformColor.offWhiteColor,
                                    borderColor: provider.isSelectedFindJob ? PlatformColor.primaryColor : PlatformColor.offWhiteColor,
                                    text: "İş Başvuruları",
                                    textColor: provider.isSelectedFindJob ? PlatformColor.offWhiteColor : PlatformColor.grayLightColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: GestureDetector(
                                  onTap: () async {
                                    await provider.selectedHireJob();
                                    await provider.fetchHireJobPostingsWithPagination();
                                  },
                                  child: PlatformTabMenu(
                                    width: (MediaQuery.of(context).size.width - 64) / 2,
                                    color: provider.isSelectedHireJob ? PlatformColor.primaryColor : PlatformColor.offWhiteColor,
                                    borderColor: provider.isSelectedHireJob ? PlatformColor.primaryColor : PlatformColor.offWhiteColor,
                                    text: "İletişim Talepleri",
                                    textColor: provider.isSelectedHireJob ? PlatformColor.offWhiteColor : PlatformColor.grayLightColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: PlatformColorFoundation.dividerColor,
              ),
              Expanded(
                flex: 4,
                child: Consumer<JobRequestsProvider>(
                  builder: (context, provider, child) {
                    if (provider.networkStatus == NetworkStatus.success) {
                      return NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo is ScrollEndNotification) {
                            if (provider.isSelectedFindJob) {
                              provider.fetchFindJobPostingsWithPagination();
                            }
                            if (provider.isSelectedHireJob) {
                              provider.fetchHireJobPostingsWithPagination();
                            }
                          }
                          return true;
                        },
                        child: JobRequestList(
                          jobRequests:
                              provider.isSelectedFindJob ? provider.allFindJobPostings : provider.allHireJobPosting,
                        ),
                      );
                    }
                    if (provider.networkStatus == NetworkStatus.error) {
                      return const Center(
                        child: Text("Uyarı çıkartılacak."),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
