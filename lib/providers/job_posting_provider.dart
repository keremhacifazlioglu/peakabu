import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/job_posting_repository.dart';

@injectable
class JobPostingProvider with ChangeNotifier {
  final JobPostingRepository _jobPostingRepository;
  List<JobPosting> allJobPostings = [], allFavoriteJobPosting = [];
  bool isLastPage = false;
  int pagingSize = 10, pageNumber = 1,pageFavoriteNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;
  JobDetail? jobDetail;

  JobPostingProvider(
      this._jobPostingRepository, @factoryParam PageType pageType) {
    if (pageType == PageType.fetch) {
      fetchJobPostingsWithPagination();
      fetchFavoriteJobPostingsWithPagination();
    } else if (pageType == PageType.detail) {
      fetchJobPostingDetail();
    }
  }

  Future fetchJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isLastPage) {
      BaseListResponse response =
          await _jobPostingRepository.fetchJobPostings(pagingSize, pageNumber);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageNumber++;
        allJobPostings.addAll(response.data! as List<JobPosting>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }


  Future fetchFavoriteJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isLastPage) {
      BaseListResponse response =
      await _jobPostingRepository.fetchFavoriteJobPostings(pagingSize, pageFavoriteNumber);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageFavoriteNumber++;
        allFavoriteJobPosting.addAll(response.data! as List<JobPosting>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future<JobDetail> fetchJobPostingDetail() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    jobDetail = await _jobPostingRepository.fetchJobPosting(1);
    networkStatus =
        jobDetail!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return jobDetail!;
  }
}
