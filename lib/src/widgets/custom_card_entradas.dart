import 'package:flutter/material.dart';
import 'package:ingresouts/src/models/entradas_response.dart';
import 'package:ingresouts/src/theme/usertheme.dart';

class CustomCardEntradas extends StatelessWidget {
  final EntradasResponse entradasResponse;
  const CustomCardEntradas({super.key, required this.entradasResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: UserTheme.cardColor,
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 3,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Docente: ${entradasResponse.correoDocente}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Estudiante: ${entradasResponse.correoEstudiante}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Ingreso: ${entradasResponse.fechaRegistro}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: const Icon(
                        Icons.check,
                        color: UserTheme.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
