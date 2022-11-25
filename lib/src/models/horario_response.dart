import 'dart:convert';

class HorarioResponse {
  HorarioResponse({
    required this.result,
  });

  List<Horario> result;

  factory HorarioResponse.fromJson(String str) => HorarioResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HorarioResponse.fromMap(Map<String, dynamic> json) => HorarioResponse(
        result: List<Horario>.from(json["result"].map((x) => Horario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Horario {
  Horario({
    required this.hEstpId,
    required this.hPegeDocumentoidentidad,
    required this.hPengPrimerapellido,
    required this.hPengSegundoapellido,
    required this.hPengPrimernombre,
    required this.hPengSegundonombre,
    required this.hUnidNombre,
    required this.hProgNombre,
    required this.hPengEmailinstitucional,
    required this.hMateCodigomateria,
    required this.hMateNombre,
    required this.hGrupNombre,
    required this.hClseDia,
    required this.hBlhoHorainicio,
    required this.hBlhoHorafinal,
    required this.hRefiNomenclatura,
    required this.hLocaDescripcion,
  });

  int hEstpId;
  String hPegeDocumentoidentidad;
  String hPengPrimerapellido;
  String hPengSegundoapellido;
  String hPengPrimernombre;
  String hPengSegundonombre;
  String hUnidNombre;
  String hProgNombre;
  String hPengEmailinstitucional;
  String hMateCodigomateria;
  String hMateNombre;
  String hGrupNombre;
  int hClseDia;
  String hBlhoHorainicio;
  String hBlhoHorafinal;
  String hRefiNomenclatura;
  String hLocaDescripcion;

  factory Horario.fromJson(String str) => Horario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Horario.fromMap(Map<String, dynamic> json) => Horario(
        hEstpId: json["H_ESTP_ID"],
        hPegeDocumentoidentidad: json["H_PEGE_DOCUMENTOIDENTIDAD"],
        hPengPrimerapellido: json["H_PENG_PRIMERAPELLIDO"],
        hPengSegundoapellido: json["H_PENG_SEGUNDOAPELLIDO"],
        hPengPrimernombre: json["H_PENG_PRIMERNOMBRE"],
        hPengSegundonombre: json["H_PENG_SEGUNDONOMBRE"],
        hUnidNombre: json["H_UNID_NOMBRE"],
        hProgNombre: json["H_PROG_NOMBRE"],
        hPengEmailinstitucional: json["H_PENG_EMAILINSTITUCIONAL"],
        hMateCodigomateria: json["H_MATE_CODIGOMATERIA"],
        hMateNombre: json["H_MATE_NOMBRE"],
        hGrupNombre: json["H_GRUP_NOMBRE"],
        hClseDia: json["H_CLSE_DIA"],
        hBlhoHorainicio: json["H_BLHO_HORAINICIO"],
        hBlhoHorafinal: json["H_BLHO_HORAFINAL"],
        hRefiNomenclatura: json["H_REFI_NOMENCLATURA"],
        hLocaDescripcion: json["H_LOCA_DESCRIPCION"],
      );

  Map<String, dynamic> toMap() => {
        "H_ESTP_ID": hEstpId,
        "H_PEGE_DOCUMENTOIDENTIDAD": hPegeDocumentoidentidad,
        "H_PENG_PRIMERAPELLIDO": hPengPrimerapellido,
        "H_PENG_SEGUNDOAPELLIDO": hPengSegundoapellido,
        "H_PENG_PRIMERNOMBRE": hPengPrimernombre,
        "H_PENG_SEGUNDONOMBRE": hPengSegundonombre,
        "H_UNID_NOMBRE": hUnidNombre,
        "H_PROG_NOMBRE": hProgNombre,
        "H_PENG_EMAILINSTITUCIONAL": hPengEmailinstitucional,
        "H_MATE_CODIGOMATERIA": hMateCodigomateria,
        "H_MATE_NOMBRE": hMateNombre,
        "H_GRUP_NOMBRE": hGrupNombre,
        "H_CLSE_DIA": hClseDia,
        "H_BLHO_HORAINICIO": hBlhoHorainicio,
        "H_BLHO_HORAFINAL": hBlhoHorafinal,
        "H_REFI_NOMENCLATURA": hRefiNomenclatura,
        "H_LOCA_DESCRIPCION": hLocaDescripcion,
      };
}
