// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:platform/config/module.dart' as _i21;
import 'package:platform/cons/page_type.dart' as _i11;
import 'package:platform/network/rest_client.dart' as _i5;
import 'package:platform/providers/applicant_hired_provider.dart' as _i17;
import 'package:platform/providers/applicant_provider.dart' as _i18;
import 'package:platform/providers/job_posting_provider.dart' as _i19;
import 'package:platform/providers/job_requests_provider.dart' as _i10;
import 'package:platform/providers/other_provider.dart' as _i20;
import 'package:platform/providers/root_provider.dart' as _i14;
import 'package:platform/providers/root_recruiter_provider.dart' as _i15;
import 'package:platform/providers/splash_provider.dart' as _i16;
import 'package:platform/repository/applicant_repository.dart' as _i7;
import 'package:platform/repository/auth_repository.dart' as _i8;
import 'package:platform/repository/job_posting_repository.dart' as _i9;
import 'package:platform/repository/other_repository.dart' as _i12;
import 'package:platform/service/other_service.dart' as _i13;
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
    gh.factory<_i7.ApplicantRepository>(
        () => _i7.ApplicantRepository(gh<_i5.RestClient>()));
    gh.factory<_i8.AuthRepository>(
        () => _i8.AuthRepository(gh<_i5.RestClient>()));
    gh.factory<_i9.JobPostingRepository>(
        () => _i9.JobPostingRepository(gh<_i5.RestClient>()));
    gh.factoryParam<_i10.JobRequestsProvider, _i11.PageType, dynamic>((
      pageType,
      _,
    ) =>
        _i10.JobRequestsProvider(
          gh<_i9.JobPostingRepository>(),
          pageType,
          selectedTab: gh<bool>(),
        ));
    gh.factory<_i12.OtherRepository>(
        () => _i12.OtherRepository(gh<_i5.RestClient>()));
    gh.factory<_i13.OtherService>(
        () => _i13.OtherService(gh<_i12.OtherRepository>()));
    gh.factory<_i14.RootProvider>(
        () => _i14.RootProvider(gh<_i6.SecureLocalRepository>()));
    gh.factory<_i15.RootRecruiterProvider>(
        () => _i15.RootRecruiterProvider(gh<_i6.SecureLocalRepository>()));
    gh.factory<_i16.SplashProvider>(() => _i16.SplashProvider(
          gh<_i6.SecureLocalRepository>(),
          gh<_i8.AuthRepository>(),
        ));
    gh.factoryParam<_i17.ApplicantHiredProvider, _i11.PageType, dynamic>((
      pageType,
      _,
    ) =>
        _i17.ApplicantHiredProvider(
          gh<_i7.ApplicantRepository>(),
          pageType,
          selectedTab: gh<bool>(),
        ));
    gh.factoryParam<_i18.ApplicantProvider, _i11.PageType, dynamic>((
      pageType,
      _,
    ) =>
        _i18.ApplicantProvider(
          gh<_i7.ApplicantRepository>(),
          gh<_i6.SecureLocalRepository>(),
          gh<_i13.OtherService>(),
          pageType,
        ));
    gh.factoryParam<_i19.JobPostingProvider, _i11.PageType, dynamic>((
      pageType,
      _,
    ) =>
        _i19.JobPostingProvider(
          gh<_i9.JobPostingRepository>(),
          gh<_i6.SecureLocalRepository>(),
          gh<_i13.OtherService>(),
          pageType,
        ));
    gh.factory<_i20.OtherProvider>(
        () => _i20.OtherProvider(gh<_i12.OtherRepository>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
