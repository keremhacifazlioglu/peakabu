import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/repository/impl/applicant_repository_impl.dart';

import '../network/rest_client.dart';

@injectable
class ApplicantRepository implements IApplicantRepository {
  final RestClient _restClient;

  ApplicantRepository(this._restClient);

  @override
  Future<ApplicantProfile> me() async {
    ApplicantProfile applicantProfile = ApplicantProfile();
    try {
      applicantProfile = await _restClient.me();
      applicantProfile.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      applicantProfile.message = e.text;
      applicantProfile.status = e.response!.statusCode;
      applicantProfile.isSuccess = false;
    }
    return applicantProfile;
  }
}
