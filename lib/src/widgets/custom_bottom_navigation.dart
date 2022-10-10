import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/bottom_service.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 3,
        currentIndex: bottomService.selectedIndex,
        onTap: (value) {
          bottomService.selectedIndex = value;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: 'Listar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_list), label: 'Perfil')
        ]);
  }
}
