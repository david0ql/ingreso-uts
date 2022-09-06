import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _MainContentLogo(),
            _FooterBox(),
          ],
        ),
      ),
    ));
  }
}

class _MainContentLogo extends StatelessWidget {
  const _MainContentLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Image(
        image: AssetImage("assets/logo_uts.png"),
      ),
    );
  }
}

class _FooterBox extends StatelessWidget {
  const _FooterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: const [
            Text("Diseñado por: "),
            Text("Juan David Gómez"),
            Text("Andrés Eduardo Sánchez"),
            Text("Jose David Gómez"),
            Text("Daniel Felipe Rincon"),
            Text("Jhan Carlos Rueda")
          ],
        ));
  }
}
