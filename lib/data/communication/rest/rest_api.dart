import 'package:injectable/injectable.dart';
import 'package:openapi_base/openapi_base.dart';
import 'package:poll_power/data/communication/rest/i_rest_api.dart';
import 'package:poll_power_openapi/openapi/pollpower.openapi.dart';

@Singleton(as: IRestAPI)
class RestApiImpl implements IRestAPI {
  final String baseUrl;
  RestApiImpl(@Named('baseUrl') this.baseUrl);

  PollPowerAPIClient client() {
    final HttpRequestSender sender = HttpRequestSender();
    return PollPowerAPIClient(Uri.parse(baseUrl), sender);
  }

  @override
  Future<GetBasePathResponse> getBasePath() async {
    final GetBasePathResponse response = await client().getBasePath();
    return response;
  }

  @override
  Future<GetCandidatesResponse> getCandidates() async {
    final GetCandidatesResponse response = await client().getCandidates();
    return response;
  }

  @override
  Future<LoginUserResponse> loginUser(UserLoginRequest body) async {
    final LoginUserResponse response = await client().loginUser(body);
    return response;
  }

  @override
  Future<SignUpCandidateResponse> signUpCandidate(Candidate body) async {
    final SignUpCandidateResponse response =
        await client().signUpCandidate(body);
    return response;
  }

  @override
  Future<SignUpUserResponse> signUpUser(User body) async {
    return await client().signUpUser(body);
  }

  @override
  Future<VoteCandidateResponse> voteCandidate(VotingRequest body) async {
    return await client().voteCandidate(body);
  }
}
