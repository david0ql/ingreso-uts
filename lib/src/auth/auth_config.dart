import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

class AuthAzure {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final Config config = Config(
    tenant: "8c28de3c-6c8e-40a2-beec-bd8827b92802",
    clientId: "6112809e-ef44-4718-be4d-9826c4eb1ed3",
    scope: "openid profile offline_access user.read",
    redirectUri: "https://login.live.com/oauth20_desktop.srf",
    navigatorKey: navigatorKey,
  );

  static final AadOAuth oauth = AadOAuth(config);
}
