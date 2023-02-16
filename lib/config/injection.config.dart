// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:platform/config/module.dart' as _i10;
import 'package:platform/network/rest_client.dart' as _i5;
import 'package:platform/providers/job_posting_provider.dart' as _i8;
import 'package:platform/repository/auth_repository.dart' as _i7;
import 'package:platform/repository/job_posting_repository.dart' as _i9;
import 'package:platform/storage/secure_local_repository.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.retrofitApi);
    gh.lazySingleton<_i4.FlutterSecureStorage>(
        () => appModule.flutterSecureStorage());
    gh.lazySingleton<_i5.RestClient>(() => appModule.restClient);
    gh.factory<_i6.SecureLocalRepository>(
        () => _i6.SecureLocalRepository(gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i7.AuthRepository>(
        () => _i7.AuthRepository(gh<_i5.RestClient>()));
    gh.factory<_i8.JobPostingProvider>(
        () => _i8.JobPostingProvider(gh<_i7.AuthRepository>()));
    gh.factory<_i9.JobPostingRepository>(
        () => _i9.JobPostingRepository(gh<_i5.RestClient>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
