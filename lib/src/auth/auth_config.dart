import 'package:flutter_appauth/flutter_appauth.dart';

class AuthConfig {
  static const String apiKey = "JSPHPWORKS4everandever!";
  static const String clientId = "6112809e-ef44-4718-be4d-9826c4eb1ed3";
  static const String redirectUrl = "graph-tutorial://flutter-auth";
  static const AuthorizationServiceConfiguration
      authorizationServiceConfiguration = AuthorizationServiceConfiguration(
          authorizationEndpoint:
              'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
          tokenEndpoint:
              'https://login.microsoftonline.com/common/oauth2/v2.0/token');

  static const List<String> scopes = [
    'openid',
    'profile',
    'user.read',
    'offline_access'
  ];
}
