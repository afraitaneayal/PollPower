// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import 'core/helpers/token_helper.dart' as _i18;
import 'core/modules/rest_api_module.dart' as _i36;
import 'core/modules/storage_module.dart' as _i35;
import 'core/ui/theme/colors/default_app_colors.dart' as _i4;
import 'core/ui/theme/colors/i_app_colors.dart' as _i3;
import 'core/ui/theme/gaps/default_app_gaps.dart' as _i6;
import 'core/ui/theme/gaps/i_app_gaps.dart' as _i5;
import 'core/ui/theme/typography/default_app_typography.dart' as _i8;
import 'core/ui/theme/typography/i_app_typography.dart' as _i7;
import 'data/communication/rest/i_rest_api.dart' as _i24;
import 'data/communication/rest/rest_api.dart' as _i25;
import 'data/communication/rest/rest_api_client.dart' as _i31;
import 'data/datasources/i_candidate_datasource_repository.dart' as _i9;
import 'data/datasources/i_user_datasource_repository.dart' as _i26;
import 'data/datasources/i_vote_datasource_repository.dart' as _i13;
import 'data/datasources/remote_datasource/rest/candidate/remote_candidate_datasource_impl.dart'
    as _i10;
import 'data/datasources/remote_datasource/rest/user/remote_user_datasource_impl.dart'
    as _i27;
import 'data/datasources/remote_datasource/rest/vote/remote_vote_datasource_impl.dart'
    as _i14;
import 'data/repositories/candidate/candidate_repository_impl.dart' as _i12;
import 'data/repositories/user/user_repository_impl.dart' as _i29;
import 'data/repositories/vote/vote_repository_impl.dart' as _i16;
import 'domain/reposirory/candidate/i_candidate_repository.dart' as _i11;
import 'domain/reposirory/user/i_user_repository.dart' as _i28;
import 'domain/reposirory/vote/i_vote_repository.dart' as _i15;
import 'domain/usecases/candidate/create_candidate_usecase.dart' as _i19;
import 'domain/usecases/candidate/get_all_candidate_usecase.dart' as _i21;
import 'domain/usecases/candidate/get_candidate_usecase.dart' as _i22;
import 'domain/usecases/user/create_user_usecase.dart' as _i32;
import 'domain/usecases/user/get_user_usecase.dart' as _i33;
import 'domain/usecases/user/log_user_uscase.dart' as _i30;
import 'domain/usecases/vote/create_vote_usecase.dart' as _i20;
import 'domain/usecases/vote/get_votes_usecase.dart' as _i23;
import 'presentation/state_management/bloc/auth/auth_bloc.dart' as _i34;

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
    gh.singleton<_i3.IAppColors>(_i4.DefaultAppColors());
    gh.singleton<_i5.IAppGaps>(_i6.DefaultAppGaps());
    gh.singleton<_i7.IAppTypography>(_i8.DefaultAppTypography());
    gh.singleton<_i9.ICandidateDatasourceRepository>(
        _i10.RemoteCandidateDatasourceWithRestImpl());
    gh.singleton<_i11.ICandidateRepository>(
        _i12.CandidateRepositoryImpl(gh<_i9.ICandidateDatasourceRepository>()));
    gh.singleton<_i13.IVoteDatasourceRepository>(_i14.VoteDatasourceImpl());
    gh.singleton<_i15.IVoteRepository>(
        _i16.VoteRepository(gh<_i13.IVoteDatasourceRepository>()));
    await gh.singletonAsync<_i17.SharedPreferences>(
      () => storageModule.instance,
      instanceName: 'pref',
      preResolve: true,
    );
    gh.singleton<String>(
      restApiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i18.TokenHelper>(
        _i18.TokenHelper(gh<_i17.SharedPreferences>(instanceName: 'pref')));
    gh.singleton<_i19.CreateCandidateUsecase>(
        _i19.CreateCandidateUsecase(gh<_i11.ICandidateRepository>()));
    gh.singleton<_i20.CreateVoteUsecase>(
        _i20.CreateVoteUsecase(gh<_i15.IVoteRepository>()));
    gh.singleton<_i21.GetAllCandidateUsecase>(
        _i21.GetAllCandidateUsecase(gh<_i11.ICandidateRepository>()));
    gh.singleton<_i22.GetCandidateUsecase>(
        _i22.GetCandidateUsecase(gh<_i11.ICandidateRepository>()));
    gh.singleton<_i23.GetVotesUsecase>(
        _i23.GetVotesUsecase(gh<_i15.IVoteRepository>()));
    gh.singleton<_i24.IRestAPI>(
        _i25.RestApiImpl(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i26.IUserDatasource>(
        _i27.RemoteUserDatasourceWithRestImpl(gh<_i24.IRestAPI>()));
    gh.singleton<_i28.IUserRepository>(
        _i29.UserRepositoryImpl(gh<_i26.IUserDatasource>()));
    gh.singleton<_i30.LogUserUsecase>(
        _i30.LogUserUsecase(gh<_i28.IUserRepository>()));
    gh.singleton<_i31.RestApiClient>(
        _i31.RestApiClient(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i32.CreateUserUsecase>(
        _i32.CreateUserUsecase(gh<_i28.IUserRepository>()));
    gh.singleton<_i33.GetUserUsecase>(
        _i33.GetUserUsecase(gh<_i28.IUserRepository>()));
    gh.singleton<_i34.AuthBloc>(_i34.AuthBloc(
      gh<_i32.CreateUserUsecase>(),
      gh<_i30.LogUserUsecase>(),
      gh<_i19.CreateCandidateUsecase>(),
    ));
    return this;
  }
}

class _$StorageModule extends _i35.StorageModule {}

class _$RestApiModule extends _i36.RestApiModule {}
