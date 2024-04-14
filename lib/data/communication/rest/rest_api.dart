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
  Future<GetCandidatesResponse> getCandidates() async {
    final GetCandidatesResponse response = await _client.getCandidates();
    return response;
  }

  @override
  Future<LoginUserResponse> loginUser(UserLoginRequest body) async {
    final LoginUserResponse response = await _client.loginUser(body);
    return response;
  }

  @override
  Future<SignUpCandidateResponse> signUpCandidate(Candidate body) async {
    final SignUpCandidateResponse response =
        await _client.signUpCandidate(body);
    return response;
  }

  @override
  Future<SignUpUserResponse> signUpUser(User body) async {
    return await _client.signUpUser(body);
  }

  @override
  Future<VoteCandidateResponse> voteCandidate(VotingRequest body) async {
    return await _client.voteCandidate(body);
  }
}
