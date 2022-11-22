import 'dart:convert';

class EntradasResponse {
  EntradasResponse({
    required this.idEntrada,
    required this.correoDocente,
    required this.correoEstudiante,
    required this.fechaRegistro,
  });

  int idEntrada;
  String correoDocente;
  String correoEstudiante;
  DateTime fechaRegistro;

  factory EntradasResponse.fromJson(String str) => EntradasResponse.fromMap(json.decode(str));

  factory EntradasResponse.fromMap(Map<String, dynamic> json) => EntradasResponse(
        idEntrada: json["id_entrada"],
        correoDocente: json["correo_docente"],
        correoEstudiante: json["correo_estudiante"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
      );
}
