// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

class UserResponse {
  UserResponse({
    required this.result,
  });

  List<User> result;

  factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        result: List<User>.from(json["result"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class User {
  User({
    required this.cEstpId,
    required this.cPegeDocumentoidentidad,
    required this.cPengPrimerapellido,
    required this.cPengSegundoapellido,
    required this.cPengPrimernombre,
    required this.cPengSegundonombre,
    required this.cUnidNombre,
    required this.cProgNombre,
    required this.cFranDescripcion,
    required this.cPensDescripcion,
    required this.cPensTotalcreditos,
    required this.cEstpCreditosaprobados,
    required this.cAvance,
    required this.cCateDescripcion,
    required this.cSiteDescripcion,
    required this.cPengEmailinstitucional,
    required this.cEstpPromediogeneral,
    required this.cPeunFechafin,
  });

  int cEstpId;
  String cPegeDocumentoidentidad;
  String cPengPrimerapellido;
  String cPengSegundoapellido;
  String cPengPrimernombre;
  String cPengSegundonombre;
  String cUnidNombre;
  String cProgNombre;
  String cFranDescripcion;
  String cPensDescripcion;
  int cPensTotalcreditos;
  int cEstpCreditosaprobados;
  double cAvance;
  String cCateDescripcion;
  String cSiteDescripcion;
  String cPengEmailinstitucional;
  double cEstpPromediogeneral;
  DateTime cPeunFechafin;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        cEstpId: json["C_ESTP_ID"],
        cPegeDocumentoidentidad: json["C_PEGE_DOCUMENTOIDENTIDAD"],
        cPengPrimerapellido: json["C_PENG_PRIMERAPELLIDO"],
        cPengSegundoapellido: json["C_PENG_SEGUNDOAPELLIDO"],
        cPengPrimernombre: json["C_PENG_PRIMERNOMBRE"],
        cPengSegundonombre: json["C_PENG_SEGUNDONOMBRE"],
        cUnidNombre: json["C_UNID_NOMBRE"],
        cProgNombre: json["C_PROG_NOMBRE"],
        cFranDescripcion: json["C_FRAN_DESCRIPCION"],
        cPensDescripcion: json["C_PENS_DESCRIPCION"],
        cPensTotalcreditos: json["C_PENS_TOTALCREDITOS"],
        cEstpCreditosaprobados: json["C_ESTP_CREDITOSAPROBADOS"],
        cAvance: json["C_AVANCE"].toDouble(),
        cCateDescripcion: json["C_CATE_DESCRIPCION"],
        cSiteDescripcion: json["C_SITE_DESCRIPCION"],
        cPengEmailinstitucional: json["C_PENG_EMAILINSTITUCIONAL"],
        cEstpPromediogeneral: json["C_ESTP_PROMEDIOGENERAL"].toDouble(),
        cPeunFechafin: DateTime.parse(json["C_PEUN_FECHAFIN"]),
      );

  Map<String, dynamic> toMap() => {
        "C_ESTP_ID": cEstpId,
        "C_PEGE_DOCUMENTOIDENTIDAD": cPegeDocumentoidentidad,
        "C_PENG_PRIMERAPELLIDO": cPengPrimerapellido,
        "C_PENG_SEGUNDOAPELLIDO": cPengSegundoapellido,
        "C_PENG_PRIMERNOMBRE": cPengPrimernombre,
        "C_PENG_SEGUNDONOMBRE": cPengSegundonombre,
        "C_UNID_NOMBRE": cUnidNombre,
        "C_PROG_NOMBRE": cProgNombre,
        "C_FRAN_DESCRIPCION": cFranDescripcion,
        "C_PENS_DESCRIPCION": cPensDescripcion,
        "C_PENS_TOTALCREDITOS": cPensTotalcreditos,
        "C_ESTP_CREDITOSAPROBADOS": cEstpCreditosaprobados,
        "C_AVANCE": cAvance,
        "C_CATE_DESCRIPCION": cCateDescripcion,
        "C_SITE_DESCRIPCION": cSiteDescripcion,
        "C_PENG_EMAILINSTITUCIONAL": cPengEmailinstitucional,
        "C_ESTP_PROMEDIOGENERAL": cEstpPromediogeneral,
        "C_PEUN_FECHAFIN": cPeunFechafin.toIso8601String(),
      };
}
