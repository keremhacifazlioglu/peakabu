
import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/city.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:platform/repository/other_repository.dart';

@injectable
class OtherService {
  final OtherRepository _otherRepository;
  Map<String, String> caretakerTypes = {},
      shiftSystems = {},
      ages = {},
      experiences = {},
      nationalities = {},
      cities = {},
      filterData = {};
  String? selectedCaretakerType,
      selectedShiftSystem,
      selectedExperience,
      selectedNationality,
      selectedCity,
      selectedAge;
  bool gender = true;

  OtherService(this._otherRepository);

  Future<Map<String, String>> fetchCaretakerTypes() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchCaretakerTypes();
    var response = baseListResponse.data! as List<CaretakerType>;
    selectedCaretakerType = response.first.value;
    for (var item in response) {
      caretakerTypes[item.key!] = item.value!;
    }
    return caretakerTypes;
  }


  Future<Map<String, String>> fetchShiftSystems() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchShiftSystems();
    var response = baseListResponse.data! as List<ShiftSystem>;
    selectedShiftSystem = response.first.value;
    for (var item in response) {
      shiftSystems[item.key!] = item.value!;
    }
    return shiftSystems;
  }

  Future<Map<String, String>> fetchAges() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchAges();
    var response = baseListResponse.data! as List<Age>;
    selectedAge = response.first.value;
    for (var item in response) {
      ages[item.key!] = item.value!;
    }
    return ages;
  }


  Future<Map<String, String>> fetchExperiences() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchExperiences();
    var response = baseListResponse.data! as List<Experience>;
    selectedExperience = response.first.value;
    for (var item in response) {
      experiences[item.key!] = item.value!;
    }
    return experiences;
  }



  Future<Map<String, String>> fetchNationalities() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchNationalities();
    var response = baseListResponse.data! as List<Nationality>;
    selectedNationality = response.first.value;
    for (var item in response) {
      nationalities[item.key!] = item.value!;
    }
    return nationalities;
  }


  Future<Map<String, String>> fetchCities() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchCities();
    var response = baseListResponse.data! as List<City>;
    selectedCity = response.first.value;
    for (var item in response) {
      cities[item.key!] = item.value!;
    }
    return cities;
  }
}