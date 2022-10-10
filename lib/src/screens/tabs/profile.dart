import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ingresouts/src/preferences_user/preferences_user.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  dynamic bytesOut;

  @override
  void initState() {
    super.initState();
    bytesOut = base64.decode(UserPreferences.photo);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: Image.memory(
                  bytesOut,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(UserPreferences.correo),
          Text(UserPreferences.id),
          Text(UserPreferences.job),
          Text(UserPreferences.nombre),
          ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 1),
              onPressed: () {
                UserPreferences.correo = "";
                UserPreferences.id = "";
                UserPreferences.job = "";
                UserPreferences.nombre = "";
                UserPreferences.photo = "";
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: const Text("Cerrar sesion"))
        ],
      ),
    );
  }
}
