// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ingresouts/src/preferences_user/preferences_user.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../auth/auth_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _LogoSoy(),
            _LoginAction(heightScreen: heightScreen),
          ],
        ),
      ),
    ));
  }
}

class _LogoSoy extends StatelessWidget {
  const _LogoSoy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        child: const Image(image: AssetImage("assets/logo.png")));
  }
}

class _LoginAction extends StatelessWidget {
  final double heightScreen;
  const _LoginAction({Key? key, required this.heightScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterAppAuth appAuth = const FlutterAppAuth();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: UserTheme.primaryColor,
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                try {
                  final result = await appAuth.authorizeAndExchangeCode(
                    AuthorizationTokenRequest(
                        AuthConfig.clientId, AuthConfig.redirectUrl,
                        serviceConfiguration:
                            AuthConfig.authorizationServiceConfiguration,
                        scopes: AuthConfig.scopes),
                  );
                  final idToken = result!.idToken;
                  final accessToken = result.accessToken;
                  Map<String, dynamic> decodedToken =
                      JwtDecoder.decode(idToken!);
                  final String correoUser = decodedToken["preferred_username"];
                  String uri = 'https://graph.microsoft.com/v1.0/me';
                  Map<String, String> headers = {
                    'Authorization': '$accessToken',
                  };
                  headers.addAll({'responseType': 'arrayBuffer'});
                  final response =
                      await http.get(Uri.parse(uri), headers: headers);

                  final photoHttp = await http
                      .get(Uri.parse("$uri/photo/\$value"), headers: headers);
                  final printableString = base64.encode(photoHttp.bodyBytes);
                  UserPreferences.photo = printableString;

                  Map<String, dynamic> userInfo = jsonDecode(response.body);
                  UserPreferences.job = userInfo["jobTitle"];
                  UserPreferences.nombre = userInfo["displayName"];
                  UserPreferences.id = userInfo["id"];
                  final idTipoToken =
                      correoUser.substring(correoUser.lastIndexOf("@") + 1);
                  if (idTipoToken != "correo.uts.edu.co") {
                    UserPreferences.correo = correoUser;
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No eres un docente"),
                    ));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
                  ));
                }
              },
              child: Text(
                "Log in",
                style: GoogleFonts.firaSans(
                    textStyle: TextStyle(
                        fontSize: heightScreen * 0.03, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
