import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/job_posting_repository.dart';

@injectable
class JobRequestsProvider with ChangeNotifier {
  final JobPostingRepository _jobPostingRepository;
  List<JobRequest> allFindJobPostings = [],
      allHireJobPosting = [];
  bool isLastPage = false,
      isHireLastPage = false,
      isSelectedFindJob = true,
      isSelectedHireJob = false, selectedTab = true;
  int pagingSize = 10,
      pageFindJobNumber = 1,
      pageHireJobNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;

  JobRequestsProvider(this._jobPostingRepository, @factoryParam PageType pageType, {bool selectedTab = true}) {
    if (pageType == PageType.fetch) {
      fetchFindJobPostingsWithPagination();
      fetchHireJobPostingsWithPagination();
    }
    selectedTabMenu(selectedTab);
  }

  Future fetchFindJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isLastPage) {
      BaseListResponse response = await _jobPostingRepository.findJobPostings(pagingSize, pageFindJobNumber);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageFindJobNumber++;
        allFindJobPostings.addAll(response.data! as List<JobRequest>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future fetchHireJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isHireLastPage) {
      BaseListResponse response = await _jobPostingRepository.findHirePostings(pagingSize, pageHireJobNumber);
      if (response.isSuccess!) {
        isHireLastPage = response.data!.length < pagingSize;
        pageHireJobNumber++;
        allHireJobPosting.addAll(response.data! as List<JobRequest>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future selectedTabMenu(bool selectedTab) async {
    isSelectedFindJob = selectedTab;
    isSelectedHireJob = !selectedTab;
    notifyListeners();
  }

    Future selectedFindJob() async {
    isSelectedFindJob = true;
    isSelectedHireJob = false;
    notifyListeners();
  }

  Future selectedHireJob() async {
    isSelectedHireJob = true;
    isSelectedFindJob = false;
    notifyListeners();
  }

}
