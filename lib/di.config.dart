// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'core/helpers/app_key_helper.dart' as _i3;
import 'core/helpers/token_helper.dart' as _i11;
import 'core/modules/rest_api_module.dart' as _i34;
import 'core/modules/storage_module.dart' as _i33;
import 'core/ui/theme/colors/default_app_colors.dart' as _i5;
import 'core/ui/theme/colors/i_app_colors.dart' as _i4;
import 'core/ui/theme/gaps/default_app_gaps.dart' as _i7;
import 'core/ui/theme/gaps/i_app_gaps.dart' as _i6;
import 'core/ui/theme/typography/default_app_typography.dart' as _i9;
import 'core/ui/theme/typography/i_app_typography.dart' as _i8;
import 'data/communication/rest/i_rest_api.dart' as _i12;
import 'data/communication/rest/rest_api.dart' as _i13;
import 'data/communication/rest/rest_api_client.dart' as _i19;
import 'data/datasources/i_candidate_datasource_repository.dart' as _i22;
import 'data/datasources/i_user_datasource_repository.dart' as _i14;
import 'data/datasources/remote_datasource/rest/candidate/remote_candidate_datasource_impl.dart'
    as _i23;
import 'data/datasources/remote_datasource/rest/user/remote_user_datasource_impl.dart'
    as _i15;
import 'data/repositories/candidate/candidate_repository_impl.dart' as _i25;
import 'data/repositories/user/user_repository_impl.dart' as _i17;
import 'domain/reposirory/candidate/i_candidate_repository.dart' as _i24;
import 'domain/reposirory/user/i_user_repository.dart' as _i16;
import 'domain/usecases/candidate/create_candidate_usecase.dart' as _i28;
import 'domain/usecases/candidate/get_all_candidate_usecase.dart' as _i29;
import 'domain/usecases/candidate/get_candidate_usecase.dart' as _i30;
import 'domain/usecases/candidate/vote_candidate_usecase.dart' as _i27;
import 'domain/usecases/user/create_user_usecase.dart' as _i20;
import 'domain/usecases/user/get_user_usecase.dart' as _i21;
import 'domain/usecases/user/log_user_uscase.dart' as _i18;
import 'presentation/state_management/bloc/auth/auth_bloc.dart' as _i31;
import 'presentation/state_management/bloc/candidate/candidate_bloc.dart'
    as _i32;
import 'presentation/state_management/bloc/user/user_bloc.dart' as _i26;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final restApiModule = _$RestApiModule();
    gh.singleton<_i3.AppKeyHelper>(() => _i3.AppKeyHelper());
    gh.singleton<_i4.IAppColors>(() => _i5.DefaultAppColors());
    gh.singleton<_i6.IAppGaps>(() => _i7.DefaultAppGaps());
    gh.singleton<_i8.IAppTypography>(() => _i9.DefaultAppTypography());
    await gh.singletonAsync<_i10.SharedPreferences>(
      () => storageModule.instance,
      instanceName: 'pref',
      preResolve: true,
    );
    gh.singleton<String>(
      () => restApiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i11.TokenHelper>(() =>
        _i11.TokenHelper(gh<_i10.SharedPreferences>(instanceName: 'pref')));
    gh.singleton<_i12.IRestAPI>(
        () => _i13.RestApiImpl(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i14.IUserDatasource>(
        () => _i15.RemoteUserDatasourceWithRestImpl(gh<_i12.IRestAPI>()));
    gh.singleton<_i16.IUserRepository>(
        () => _i17.UserRepositoryImpl(gh<_i14.IUserDatasource>()));
    gh.singleton<_i18.LogUserUsecase>(
        () => _i18.LogUserUsecase(gh<_i16.IUserRepository>()));
    gh.singleton<_i19.RestApiClient>(
        () => _i19.RestApiClient(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i20.CreateUserUsecase>(
        () => _i20.CreateUserUsecase(gh<_i16.IUserRepository>()));
    gh.singleton<_i21.GetUserUsecase>(
        () => _i21.GetUserUsecase(gh<_i16.IUserRepository>()));
    gh.singleton<_i22.ICandidateDatasourceRepository>(
        () => _i23.RemoteCandidateDatasourceWithRestImpl(gh<_i12.IRestAPI>()));
    gh.singleton<_i24.ICandidateRepository>(() => _i25.CandidateRepositoryImpl(
        gh<_i22.ICandidateDatasourceRepository>()));
    gh.singleton<_i26.UserBloc>(() => _i26.UserBloc(gh<_i21.GetUserUsecase>()));
    gh.singleton<_i27.VoteCandidateUsecase>(
        () => _i27.VoteCandidateUsecase(gh<_i24.ICandidateRepository>()));
    gh.singleton<_i28.CreateCandidateUsecase>(
        () => _i28.CreateCandidateUsecase(gh<_i24.ICandidateRepository>()));
    gh.singleton<_i29.GetAllCandidateUsecase>(
        () => _i29.GetAllCandidateUsecase(gh<_i24.ICandidateRepository>()));
    gh.singleton<_i30.GetCandidateUsecase>(
        () => _i30.GetCandidateUsecase(gh<_i24.ICandidateRepository>()));
    gh.singleton<_i31.AuthBloc>(() => _i31.AuthBloc(
          gh<_i20.CreateUserUsecase>(),
          gh<_i18.LogUserUsecase>(),
          gh<_i28.CreateCandidateUsecase>(),
        ));
    gh.singleton<_i32.CandidateBloc>(() => _i32.CandidateBloc(
          gh<_i29.GetAllCandidateUsecase>(),
          gh<_i27.VoteCandidateUsecase>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i33.StorageModule {}

class _$RestApiModule extends _i34.RestApiModule {}
