import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/applicant_repository.dart';

@injectable
class ApplicantHiredProvider with ChangeNotifier {
  final ApplicantRepository _applicantRepository;
  List<ApplicantRequest> allFindJobPostings = [],allHireJobPosting = [];
  bool isLastPage = false,
      isHireLastPage = false,
      isSelectedFindJob = true,
      isSelectedHireJob = false,
      selectedTab = true;
  int pagingSize = 10, pageFindJobNumber = 1, pageHireJobNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;

  ApplicantHiredProvider(this._applicantRepository, @factoryParam PageType pageType, {bool selectedTab = true}) {
    if (pageType == PageType.fetch) {
      fetchFindApplicantWithPagination();
      fetchHireApplicantWithPagination();
    }
    selectedTabMenu(selectedTab);
  }

  Future fetchFindApplicantWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if(allFindJobPostings.length < pagingSize){
      isLastPage = false;
      pageFindJobNumber = 1;
      allFindJobPostings.clear();
    }
    if (!isLastPage) {
      BaseListResponse response = await _applicantRepository.findApplicants(pageFindJobNumber,pagingSize);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageFindJobNumber++;
        allFindJobPostings.addAll(response.data! as List<ApplicantRequest>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future fetchHireApplicantWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if(allHireJobPosting.length < pagingSize){
      isHireLastPage = false;
      pageHireJobNumber = 1;
      allHireJobPosting.clear();
    }
    if (!isHireLastPage) {
      BaseListResponse response = await _applicantRepository.applicantRequests(pageHireJobNumber,pagingSize);
      if (response.isSuccess!) {
        isHireLastPage = response.data!.length < pagingSize;
        pageHireJobNumber++;
        allHireJobPosting.addAll(response.data! as List<ApplicantRequest>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future applyHiredRequest(int jobId) async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _applicantRepository.applyHireJob(jobId);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future rejectHiredRequest(int jobId) async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _applicantRepository.rejectHireJob(jobId);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
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
