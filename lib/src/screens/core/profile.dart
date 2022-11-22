import 'package:flutter/material.dart';
import 'package:ingresouts/src/auth/auth_config.dart';
import 'package:ingresouts/src/security/security_storage.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: bottomService.getName(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text(bottomService.nombre);
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 1),
              onPressed: () async {
                await AuthAzure.oauth.logout();
                bottomService.isLoading = true;
                await SecurityStorage.deleteAll();
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: const Text("Cerrar sesion"))
        ],
      ),
    );
  }
}
