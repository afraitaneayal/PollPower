import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_candidate_datasource_repository.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/params/candidate/create_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/get_candidate_param.dart';

@Singleton(as: ICandidateDatasourceRepository)
class RemoteCandidateDatasourceWithRestImpl
    implements ICandidateDatasourceRepository {
  @override
  Future<CandidateEntity> createCandidate(CreateCandidateParam param) {
    // TODO: implement createCandidate
    throw UnimplementedError();
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
  transform(param) {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
