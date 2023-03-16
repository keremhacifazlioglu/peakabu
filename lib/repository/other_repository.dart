import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/city.dart';
import 'package:platform/domain/response/other/district.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/network/rest_client.dart';
import 'package:platform/repository/impl/other_repository_impl.dart';

@injectable
class OtherRepository implements IOtherRepository{

  final RestClient _restClient;

  OtherRepository(this._restClient);

  @override
  Future<BaseListResponse> fetchAges() async {
    BaseListResponse<Age> baseListResponse = BaseListResponse<Age>();
    try {
      List<Age> response = await _restClient.fetchAges();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchCaretakerTypes() async {
    BaseListResponse<CaretakerType> baseListResponse = BaseListResponse<CaretakerType>();
    try {
      List<CaretakerType> response = await _restClient.fetchCaretakerTypes();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchExperiences() async {
    BaseListResponse<Experience> baseListResponse = BaseListResponse<Experience>();
    try {
      List<Experience> response = await _restClient.fetchExperiences();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchNationalities() async {
    BaseListResponse<Nationality> baseListResponse = BaseListResponse<Nationality>();
    try {
      List<Nationality> response = await _restClient.fetchNationalities();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchShiftSystems() async {
    BaseListResponse<ShiftSystem> baseListResponse = BaseListResponse<ShiftSystem>();
    try {
      List<ShiftSystem> response = await _restClient.fetchShiftSystems();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchCities() async {
    BaseListResponse<City> baseListResponse = BaseListResponse<City>();
    try {
      List<City> response = await _restClient.fetchCity();
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchDistricts(String city) async {
    BaseListResponse<District> baseListResponse = BaseListResponse<District>();
    try {
      List<District> response = await _restClient.fetchDistricts(city);
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

}
