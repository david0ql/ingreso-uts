import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ingresouts/src/screens/core/list_students.dart';
import 'package:ingresouts/src/screens/core/profile.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:ingresouts/src/widgets/custom_bottom_navigation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeSwitch(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: UserTheme.primaryColor,
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', true, ScanMode.QR);
          String result = barcodeScanRes.substring(55);
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Center(child: Center(child: Text("Usuario escaneado:"))),
                    content: Text(result),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ));
        },
        child: const Icon(
          Icons.qr_code_scanner_outlined,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    switch (bottomService.selectedIndex) {
      case 0:
        return const ListStudentsTab();
      case 1:
        return const ProfileTab();
      default:
        return const ListStudentsTab();
    }
  }
}
