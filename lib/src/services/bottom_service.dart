import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:ingresouts/src/auth/auth_config.dart';
import 'package:ingresouts/src/models/entradas_response.dart';
import 'package:http/http.dart' as http;
import 'package:ingresouts/src/models/horario_response.dart';
import 'package:ingresouts/src/models/user_response.dart';
import 'package:ingresouts/src/security/security_storage.dart';

class BottomService with ChangeNotifier {
  bool _isLoading = true;
  int _selectedIndex = 0;

  static const String _baseUrl = "whativedone.tk";
  static const String _subUrl = "api.whativedone.tk";
  List<EntradasResponse> entradas = [];
  List<Horario> horario = [];
  String nombre = "";

  String nombreEstudiante = "";
  String cedulaEstudiante = "";
  String carreraEstudiante = "";

  late Uint8List foto;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> getEntradas() async {
    entradas.clear();
    final httpRequest = await http.get(Uri.http(_baseUrl, '/api/entradas'));
    final jsonBody = jsonDecode(httpRequest.body);
    for (var element in jsonBody) {
      entradas.add(EntradasResponse.fromMap(element));
    }
  }

  Future<int> getName() async {
    final nameStorage = await SecurityStorage.read("name");
    nombre = nameStorage;
    return 1;
  }

  Future<int> getPhoto(String correo) async {
    await obtenerInfo(correo);
    //Obtener token de Azure
    final accessToken = await AuthAzure.oauth.getAccessToken();
    //Endpoint foto
    String uri = 'https://graph.microsoft.com/v1.0/users/$correo/photo/\$value';
    //Enviar el accessToken para buscar el usuario
    Map<String, String> headers = {'Authorization': '$accessToken'};
    final photoHttp = await http.get(Uri.parse(uri), headers: headers);
    final printableString = base64.encode(photoHttp.bodyBytes);
    foto = base64.decode(printableString);
    return 1;
  }

  Future<void> obtenerInfo(String correo) async {
    await getHorario();
    final httpRequest = await http.get(Uri.http(_subUrl, '/api/carnet/$correo'));
    final userReponse = UserResponse.fromJson(httpRequest.body).result;
    for (var element in userReponse) {
      nombreEstudiante = "${element.cPengPrimernombre} ${element.cPengPrimerapellido}";
      cedulaEstudiante = element.cPegeDocumentoidentidad;
      carreraEstudiante = element.cProgNombre;
    }
  }

  Future<int> insertarAsistencia(String correo) async {
    String correoDocente = await SecurityStorage.read('email');
    final headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      "correo_docente": correoDocente,
      "correo_estudiante": correo,
    };
    print(body);
    String jsonBody = json.encode(body);
    final httpRequest = await http.post(
      Uri.http(_baseUrl, '/api/entradas'),
      body: jsonBody,
      headers: headers,
    );
    return httpRequest.statusCode;
  }

  Future<void> getHorario() async {
    horario.clear();
    final correo = await SecurityStorage.read("email");
    String diaSemana = DateTime.now().weekday.toString();
    const horaEx = "0900";
    String hora = horaEx; //DateTime.now().hour.toString() + DateTime.now().minute.toString();
    final httpRequest = await http.get(Uri.http(_subUrl, '/api/schedule/$correo'));
    final horarioResponse = HorarioResponse.fromJson(httpRequest.body).result;
    for (var element in horarioResponse) {
      if (element.hClseDia.toString() == diaSemana.toString() &&
          (((int.parse(element.hBlhoHorainicio)) <= (int.parse(hora))) && ((int.parse(hora)) <= (int.parse(element.hBlhoHorafinal))))) {
        horario.add(element);
      } else {
        horario.add(Horario(
            hEstpId: 1,
            hPegeDocumentoidentidad: "hPegeDocumentoidentidad",
            hPengPrimerapellido: "hPengPrimerapellido",
            hPengSegundoapellido: "hPengSegundoapellido",
            hPengPrimernombre: "hPengPrimernombre",
            hPengSegundonombre: "hPengSegundonombre",
            hUnidNombre: "hUnidNombre",
            hProgNombre: "hProgNombre",
            hPengEmailinstitucional: "hPengEmailinstitucional",
            hMateCodigomateria: "hMateCodigomateria",
            hMateNombre: "Tiene libre",
            hGrupNombre: "hGrupNombre",
            hClseDia: int.parse(diaSemana),
            hBlhoHorainicio: "hBlhoHorainicio",
            hBlhoHorafinal: "hBlhoHorafinal",
            hRefiNomenclatura: "Sin salon",
            hLocaDescripcion: "hLocaDescripcion"));
      }
    }
  }
}
