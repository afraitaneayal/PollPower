import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:poll_power/core/error/app_error.dart';
import 'package:poll_power/data/datasources/i_candidate_datasource_repository.dart';
import 'package:poll_power/data/datasources/i_user_datasource_repository.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/params/candidate/create_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/get_candidate_param.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';

import '../../../../communication/rest/i_rest_api.dart';

@Singleton(as: ICandidateDatasourceRepository)
class RemoteCandidateDatasourceWithRestImpl
    implements ICandidateDatasourceRepository {
  final IRestAPI _api;

  RemoteCandidateDatasourceWithRestImpl(this._api);

  @override
  Future<CandidateEntity> createCandidate(CreateCandidateParam param) async {
    final Candidate body = Candidate(
        slogan: param.slogan,
        voteCount: param.voteCount,
        user: User(
            email: param.user.email,
            password: param.user.password,
            firstName: param.user.first_name,
            lastName: param.user.last_name,
            grade: param.user.grade,
            areaOfStudy: param.user.area_of_study));
    final SignUpCandidateResponse response = await _api.signUpCandidate(body);
    if (response.status == HttpStatus.created) {
      final SignUpCandidateResponse201 e =
          response as SignUpCandidateResponse201;
      return transform(Candidate.fromJson(e.body.toJson()));
    } else if (response.status == HttpStatus.badRequest) {
      final SignUpCandidateResponse400 e =
          response as SignUpCandidateResponse400;
      throw GenericAppError(e.body.error!.userFriendlyMessage.toString());
    }
    throw InternlaError();
  }

  @override
  Future<CandidateEntity?> getCandidate(GetCandidateParam param) {
    // TODO: implement getCandidate
    throw UnimplementedError();
  }

  @override
  Future<List<CandidateEntity>> getCandidates() {
    // TODO: implement getCandidates
    throw UnimplementedError();
  }

  @override
  CandidateEntity transform(param) {
    final p = param as Candidate;
    return CandidateEntity(
        slogan: p.slogan,
        speech: p.speech ?? "",
        vote_count: p.voteCount,
        uuid: null,
        user: locator.get<IUserDatasource>().transform(p.user) as UserEntity);
  }
}
