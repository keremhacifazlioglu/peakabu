import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';

abstract class IOtherRepository {
  Future<List<CaretakerType>> fetchCaretakerTypes();

  Future<List<ShiftSystem>> fetchShiftSystems();

  Future<List<Experience>> fetchExperiences();

  Future<List<Nationality>> fetchNationalities();

  Future<List<Age>> fetchAges();
}
