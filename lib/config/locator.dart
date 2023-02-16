import 'package:platform/config/injection.dart';
import 'package:platform/repository/auth_repository.dart';
import 'package:platform/storage/secure_local_repository.dart';

final SecureLocalRepository secureLocalRepository =
    getIt.get<SecureLocalRepository>();
final AuthRepository authRepository = getIt.get<AuthRepository>();
