import 'package:injectable/injectable.dart';
import 'package:poll_power/data/communication/rest/i_rest_api.dart';
import 'package:poll_power/data/communication/rest/rest_api_client.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power_openapi/openapi/pollpower.openapi.dart';

@Singleton(as: IRestAPI)
class RestApiImpl implements IRestAPI {
  final PollPowerAPIClient _client = locator.get<RestApiClient>().getClient();
  @override
  Future<GetBasePathResponse> getBasePath() async {
    final GetBasePathResponse response = await _client.getBasePath();
    return response;
  }

  @override
  Future<GetCandidatesResponse> getCandidates() {
    // TODO: implement getCandidates
    throw UnimplementedError();
  }

  @override
  Future<LoginUserResponse> loginUser(UserLoginRequest body) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<SignUpCandidateResponse> signUpCandidate(Candidate body) {
    // TODO: implement signUpCandidate
    throw UnimplementedError();
  }

  @override
  Future<SignUpUserResponse> signUpUser(User body) {
    return _client.signUpUser(body);
  }

  @override
  Future<VoteCandidateResponse> voteCandidate(VotingRequest body) {
    // TODO: implement voteCandidate
    throw UnimplementedError();
  }
}
