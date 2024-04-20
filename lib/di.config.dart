// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'core/helpers/app_key_helper.dart' as _i3;
import 'core/helpers/token_helper.dart' as _i15;
import 'core/modules/rest_api_module.dart' as _i38;
import 'core/modules/storage_module.dart' as _i37;
import 'core/ui/theme/colors/default_app_colors.dart' as _i5;
import 'core/ui/theme/colors/i_app_colors.dart' as _i4;
import 'core/ui/theme/gaps/default_app_gaps.dart' as _i7;
import 'core/ui/theme/gaps/i_app_gaps.dart' as _i6;
import 'core/ui/theme/typography/default_app_typography.dart' as _i9;
import 'core/ui/theme/typography/i_app_typography.dart' as _i8;
import 'data/communication/rest/i_rest_api.dart' as _i18;
import 'data/communication/rest/rest_api.dart' as _i19;
import 'data/communication/rest/rest_api_client.dart' as _i25;
import 'data/datasources/i_candidate_datasource_repository.dart' as _i28;
import 'data/datasources/i_user_datasource_repository.dart' as _i20;
import 'data/datasources/i_vote_datasource_repository.dart' as _i10;
import 'data/datasources/remote_datasource/rest/candidate/remote_candidate_datasource_impl.dart'
    as _i29;
import 'data/datasources/remote_datasource/rest/user/remote_user_datasource_impl.dart'
    as _i21;
import 'data/datasources/remote_datasource/rest/vote/remote_vote_datasource_impl.dart'
    as _i11;
import 'data/repositories/candidate/candidate_repository_impl.dart' as _i31;
import 'data/repositories/user/user_repository_impl.dart' as _i23;
import 'data/repositories/vote/vote_repository_impl.dart' as _i13;
import 'domain/reposirory/candidate/i_candidate_repository.dart' as _i30;
import 'domain/reposirory/user/i_user_repository.dart' as _i22;
import 'domain/reposirory/vote/i_vote_repository.dart' as _i12;
import 'domain/usecases/candidate/create_candidate_usecase.dart' as _i33;
import 'domain/usecases/candidate/get_all_candidate_usecase.dart' as _i34;
import 'domain/usecases/candidate/get_candidate_usecase.dart' as _i35;
import 'domain/usecases/user/create_user_usecase.dart' as _i26;
import 'domain/usecases/user/get_user_usecase.dart' as _i27;
import 'domain/usecases/user/log_user_uscase.dart' as _i24;
import 'domain/usecases/vote/create_vote_usecase.dart' as _i16;
import 'domain/usecases/vote/get_votes_usecase.dart' as _i17;
import 'presentation/state_management/bloc/auth/auth_bloc.dart' as _i36;
import 'presentation/state_management/bloc/user/user_bloc.dart' as _i32;

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
    gh.singleton<_i10.IVoteDatasourceRepository>(
        () => _i11.VoteDatasourceImpl());
    gh.singleton<_i12.IVoteRepository>(
        () => _i13.VoteRepository(gh<_i10.IVoteDatasourceRepository>()));
    await gh.singletonAsync<_i14.SharedPreferences>(
      () => storageModule.instance,
      instanceName: 'pref',
      preResolve: true,
    );
    gh.singleton<String>(
      () => restApiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i15.TokenHelper>(() =>
        _i15.TokenHelper(gh<_i14.SharedPreferences>(instanceName: 'pref')));
    gh.singleton<_i16.CreateVoteUsecase>(
        () => _i16.CreateVoteUsecase(gh<_i12.IVoteRepository>()));
    gh.singleton<_i17.GetVotesUsecase>(
        () => _i17.GetVotesUsecase(gh<_i12.IVoteRepository>()));
    gh.singleton<_i18.IRestAPI>(
        () => _i19.RestApiImpl(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i20.IUserDatasource>(
        () => _i21.RemoteUserDatasourceWithRestImpl(gh<_i18.IRestAPI>()));
    gh.singleton<_i22.IUserRepository>(
        () => _i23.UserRepositoryImpl(gh<_i20.IUserDatasource>()));
    gh.singleton<_i24.LogUserUsecase>(
        () => _i24.LogUserUsecase(gh<_i22.IUserRepository>()));
    gh.singleton<_i25.RestApiClient>(
        () => _i25.RestApiClient(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i26.CreateUserUsecase>(
        () => _i26.CreateUserUsecase(gh<_i22.IUserRepository>()));
    gh.singleton<_i27.GetUserUsecase>(
        () => _i27.GetUserUsecase(gh<_i22.IUserRepository>()));
    gh.singleton<_i28.ICandidateDatasourceRepository>(
        () => _i29.RemoteCandidateDatasourceWithRestImpl(gh<_i18.IRestAPI>()));
    gh.singleton<_i30.ICandidateRepository>(() => _i31.CandidateRepositoryImpl(
        gh<_i28.ICandidateDatasourceRepository>()));
    gh.singleton<_i32.UserBloc>(() => _i32.UserBloc(gh<_i27.GetUserUsecase>()));
    gh.singleton<_i33.CreateCandidateUsecase>(
        () => _i33.CreateCandidateUsecase(gh<_i30.ICandidateRepository>()));
    gh.singleton<_i34.GetAllCandidateUsecase>(
        () => _i34.GetAllCandidateUsecase(gh<_i30.ICandidateRepository>()));
    gh.singleton<_i35.GetCandidateUsecase>(
        () => _i35.GetCandidateUsecase(gh<_i30.ICandidateRepository>()));
    gh.singleton<_i36.AuthBloc>(() => _i36.AuthBloc(
          gh<_i26.CreateUserUsecase>(),
          gh<_i24.LogUserUsecase>(),
          gh<_i33.CreateCandidateUsecase>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i37.StorageModule {}

class _$RestApiModule extends _i38.RestApiModule {}
