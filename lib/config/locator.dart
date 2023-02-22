import 'package:platform/config/injection.dart';
import 'package:platform/repository/applicant_repository.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/repository/job_posting_repository.dart';
import 'package:platform/repository/other_repository.dart';
import 'package:platform/service/other_service.dart';
import 'package:platform/storage/secure_local_repository.dart';

final SecureLocalRepository secureLocalRepository = getIt.get<SecureLocalRepository>();
final AuthRepository authRepository = getIt.get<AuthRepository>();
final JobPostingRepository jobPostingRepository = getIt.get<JobPostingRepository>();
final ApplicantRepository applicantRepository = getIt.get<ApplicantRepository>();
final OtherRepository otherRepository = getIt.get<OtherRepository>();
final OtherService otherService = getIt.get<OtherService>();
