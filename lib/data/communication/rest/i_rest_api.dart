import 'package:poll_power_openapi/poll_power_openapi.dart';

abstract class IRestAPI {
  Future<GetBasePathResponse> getBasePath();
  Future<GetCandidatesResponse> getCandidates();
  Future<LoginUserResponse> loginUser(UserLoginRequest body);
  Future<VoteCandidateResponse> voteCandidate(VotingRequest body);
  Future<SignUpCandidateResponse> signUpCandidate(Candidate body);
  Future<SignUpUserResponse> signUpUser(User body);
  Future<GetUserResponse> getUser(String token);
}
