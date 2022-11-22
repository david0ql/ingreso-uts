import 'package:flutter/material.dart';
import 'package:ingresouts/src/models/entradas_response.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListStudentsTab extends StatelessWidget {
  const ListStudentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return FutureBuilder(
      future: bottomService.getEntradas(),
      builder: (context, snapshot) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: bottomService.entradas.length,
          itemBuilder: (BuildContext context, int index) {
            final EntradasResponse entradasResponse = bottomService.entradas[index];
            return CustomCardEntradas(entradasResponse: entradasResponse);
          },
        );
      },
    );
  }
}
