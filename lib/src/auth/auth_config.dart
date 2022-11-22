import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

class AuthAzure {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final Config config = Config(
    tenant: "8c28de3c-6c8e-40a2-beec-bd8827b92802",
    clientId: "9eb97803-7803-4cbb-8f2e-cfbdf0b22e89",
    scope: "openid profile offline_access",
    redirectUri: "https://login.live.com/oauth20_desktop.srf",
    navigatorKey: navigatorKey,
  );

  static final AadOAuth oauth = AadOAuth(config);
}
