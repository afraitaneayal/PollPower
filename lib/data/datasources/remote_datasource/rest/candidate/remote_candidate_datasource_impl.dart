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
import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';
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
        speech: param.speech,
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
      return transform((e.body));
    } else if (response.status == HttpStatus.badRequest) {
      final SignUpCandidateResponse400 e =
          response as SignUpCandidateResponse400;
      throw GenericAppError(e.body.error!.userFriendlyMessage.toString());
    }
    throw InternlaError();
  }

  @override
  Future<CandidateEntity?> getCandidate(GetCandidateParam param) {
    throw UnimplementedError();
  }

  @override
  Future<List<CandidateEntity>> getCandidates() async {
    final response = await _api.getCandidates();
    switch (response.runtimeType) {
      case GetCandidatesResponse200:
        final GetCandidatesResponse200 candidatesR =
            response as GetCandidatesResponse200;
        final candidates =
            candidatesR.body.candidates!.map((e) => transform(e)).toList();
        return candidates;
      case GetCandidatesResponse400:
        final candidatesR = response as GetCandidatesResponse400;
        throw GenericAppError(candidatesR.body.error!.userFriendlyMessage!);
      case GetCandidatesResponse500:
        final candidatesR = response as GetCandidatesResponse500;
        throw GenericAppError(candidatesR.body.error!.userFriendlyMessage!);
      default:
        throw InternlaError();
    }
  }

  @override
  CandidateEntity transform(param) {
    final p = param as Candidate;
    return CandidateEntity(
        slogan: p.slogan,
        speech: p.speech ?? "",
        vote_count: p.voteCount,
        uuid: p.uuid,
        user: locator.get<IUserDatasource>().transform(p.user) as UserEntity);
  }

  @override
  Future<void> voteCandidate(VoteCandidateParam param) async {
    final VotingRequest request = VotingRequest(
        candidateId: param.candidateUuid, userId: "", uuid: "", votedAt: "");
    final response = await _api.voteCandidate(request);
    if (response.status != HttpStatus.ok) {
      throw InternlaError();
    }
  }
}
