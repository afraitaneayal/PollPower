import 'package:injectable/injectable.dart';
import 'package:openapi_base/openapi_base.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';

@singleton
class RestApiClient {
  final String baseUrl;
  RestApiClient(@Named("baseUrl") this.baseUrl);

  PollPowerAPIClient getClient() {
    final HttpRequestSender sender = HttpRequestSender();
    return PollPowerAPIClient(Uri.parse(baseUrl), sender);
  }
}
