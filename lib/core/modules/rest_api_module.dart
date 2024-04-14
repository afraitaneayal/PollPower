import 'package:injectable/injectable.dart';

@module
abstract class RestApiModule {
  @singleton
  @Named("baseUrl")
  String get baseUrl => "http://localhost:8080";
}
