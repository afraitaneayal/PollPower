import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:openapi_base/openapi_base.dart';
import 'package:poll_power/core/error/app_error.dart';
import 'package:poll_power/core/error/error_catcher.dart';
import 'package:poll_power/data/communication/rest/i_rest_api.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power_openapi/openapi/pollpower.openapi.dart';
import 'package:http/http.dart' as http;

@Singleton(as: IRestAPI)
class RestApiImpl implements IRestAPI {
  final String baseUrl;
  final httpClient = http.Client();
  RestApiImpl(@Named('baseUrl') this.baseUrl);

  PollpowerClient client() {
    final HttpRequestSender sender = HttpRequestSender();
    return PollpowerClient(Uri.parse(baseUrl), sender);
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
    final response = await ErrorCatcher.networkCatch<LoginUserResponse>(
        client().loginUser(body));
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

  @override
  Future<GetUserResponse> getUser(String token) async {
    final Uri httpClientUrl =
        Uri.parse("${locator.get<String>(instanceName: 'baseUrl')}/v1/users");
    final Map<String, String> bearer = {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };
    final response = await httpClient.get(httpClientUrl, headers: bearer);
    if (response.statusCode == HttpStatus.ok) {
      // return await client().getUser();
      return GetUserResponse.response200(
          User.fromJson(json.decode(response.body)));
    } else if (response.statusCode == HttpStatus.notFound) {
      throw UserNotFoundError();
    }
    throw InternlaError();
  }
}
