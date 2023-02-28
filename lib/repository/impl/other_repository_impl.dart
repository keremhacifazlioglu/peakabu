import 'package:platform/domain/response/job/base_list_response.dart';

abstract class IOtherRepository {

  Future<BaseListResponse> fetchCaretakerTypes();

  Future<BaseListResponse> fetchShiftSystems();

  Future<BaseListResponse> fetchExperiences();

  Future<BaseListResponse> fetchNationalities();

  Future<BaseListResponse> fetchAges();

  Future<BaseListResponse> fetchCities();
}
