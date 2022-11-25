// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:provider/provider.dart';

class AlertConfirmUser extends StatefulWidget {
  final VoidCallback voidCallback;
  const AlertConfirmUser({
    Key? key,
    required this.result,
    required this.voidCallback,
  }) : super(key: key);

  final String result;

  @override
  State<AlertConfirmUser> createState() => _AlertConfirmUserState();
}

class _AlertConfirmUserState extends State<AlertConfirmUser> {
  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return AlertDialog(
      title: const Center(
        child: Center(
          child: Text("Usuario escaneado:"),
        ),
      ),
      content: FutureBuilder(
        future: bottomService.getPhoto(widget.result),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (bottomService.foto.toString().isNotEmpty)
                  ? Image.memory(
                      bottomService.foto,
                    )
                  : const CircularProgressIndicator(),
              FittedBox(child: Text("Clase actual : ${bottomService.horario[0].hMateNombre}")),
              FittedBox(child: Text("Salon actual : ${bottomService.horario[0].hRefiNomenclatura}")),
              FittedBox(child: Text(bottomService.carreraEstudiante)),
              FittedBox(child: Text(bottomService.cedulaEstudiante)),
              FittedBox(child: Text(bottomService.nombreEstudiante))
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await bottomService.insertarAsistencia(widget.result);
            Navigator.pop(context);
            widget.voidCallback();
          },
          child: const Text('Generar asistencia'),
        ),
      ],
    );
  }
}
