import 'package:flutter/material.dart';
import 'package:ingresouts/src/models/entradas_response.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListStudentsTab extends StatefulWidget {
  const ListStudentsTab({Key? key}) : super(key: key);

  @override
  State<ListStudentsTab> createState() => _ListStudentsTabState();
}

class _ListStudentsTabState extends State<ListStudentsTab> {
  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder(
        future: bottomService.getEntradas(),
        builder: (context, snapshot) {
          return ListView.builder(
            reverse: true,
            itemCount: bottomService.entradas.length,
            itemBuilder: (BuildContext context, int index) {
              final EntradasResponse entradasResponse = bottomService.entradas[index];
              return CustomCardEntradas(entradasResponse: entradasResponse);
            },
          );
        },
      ),
    );
  }
}
