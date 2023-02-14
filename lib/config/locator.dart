import 'package:platform/config/injection.dart';
import 'package:platform/storage/secure_local_repository.dart';

final SecureLocalRepository secureLocalRepository =
    getIt.get<SecureLocalRepository>();
