import 'package:peakabu/config/injection.dart';
import 'package:peakabu/repository/applicant_repository.dart';
import 'package:peakabu/repository/auth_repository.dart';
import 'package:peakabu/repository/job_posting_repository.dart';
import 'package:peakabu/repository/other_repository.dart';
import 'package:peakabu/service/other_service.dart';
import 'package:peakabu/storage/secure_local_repository.dart';

final SecureLocalRepository secureLocalRepository = getIt.get<SecureLocalRepository>();
final AuthRepository authRepository = getIt.get<AuthRepository>();
final JobPostingRepository jobPostingRepository = getIt.get<JobPostingRepository>();
final ApplicantRepository applicantRepository = getIt.get<ApplicantRepository>();
final OtherRepository otherRepository = getIt.get<OtherRepository>();
final OtherService otherService = getIt.get<OtherService>();
