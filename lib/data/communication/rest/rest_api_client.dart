import 'package:injectable/injectable.dart';
import 'package:openapi_base/openapi_base.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';

@singleton
class RestApiClient {
  final HttpRequestSender sender;
  final String baseUrl;
  RestApiClient(this.sender, @Named("baseUrl") this.baseUrl);

  PollPowerAPIClient getClient() {
    return PollPowerAPIClient(Uri.parse(baseUrl), sender);
  }
}
