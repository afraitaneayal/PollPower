import 'package:injectable/injectable.dart';
import 'package:openapi_base/openapi_base.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';

@singleton
class RestApiClient {
  final String baseUrl;
  RestApiClient(@Named("baseUrl") this.baseUrl);

  PollpowerClient getClient() {
    final HttpRequestSender sender = HttpRequestSender();
    return PollpowerClient(Uri.parse(baseUrl), sender);
  }
}
