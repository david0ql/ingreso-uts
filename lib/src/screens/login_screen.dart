// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

import '../auth/auth_config.dart';
import '../security/security_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return Container(margin: const EdgeInsets.all(30), child: const Image(image: AssetImage("assets/logo.png")));
  }
}

class _LoginAction extends StatelessWidget {
  final double heightScreen;
  const _LoginAction({Key? key, required this.heightScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: (bottomService.isLoading)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: UserTheme.primaryColor,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      bottomService.isLoading = false;
                      final result = await AuthAzure.oauth.login();
                      result.fold(
                        (l) => handleLoginErrors(context),
                        (r) async {
                          final accessToken = await AuthAzure.oauth.getAccessToken();
                          onSucces(context, accessToken!);
                        },
                      );
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.firaSans(
                          textStyle: TextStyle(
                        fontSize: heightScreen * 0.03,
                        color: Colors.white,
                      )),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  void onSucces(BuildContext context, String accessToken) async {
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
    await SecurityStorage.write('name', payload["name"]);
    await SecurityStorage.write('email', payload["unique_name"]);
    await SecurityStorage.write('ip', payload["ipaddr"]);
    final idTipoToken = payload["unique_name"].substring(payload["unique_name"].lastIndexOf("@") + 1);
    handleLogin(context, idTipoToken);
  }

  handleLoginErrors(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Ha ocurrido un error"),
    ));
  }

  handleLogin(BuildContext context, String idTipoToken) {
    (idTipoToken != "correo.uts.edu.co")
        ? Navigator.pushReplacementNamed(context, 'home')
        : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("No eres un docente"),
          ));
  }
}
