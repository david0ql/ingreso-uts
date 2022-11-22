import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ingresouts/src/models/entradas_response.dart';
import 'package:http/http.dart' as http;
import 'package:ingresouts/src/security/security_storage.dart';

class BottomService with ChangeNotifier {
  bool _isLoading = true;
  int _selectedIndex = 0;

  static const String _baseUrl = "whativedone.tk";

  List<EntradasResponse> entradas = [];

  String nombre = "";

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

  Future<void> getName() async {
    final nameStorage = await SecurityStorage.read("name");
    nombre = nameStorage;
    notifyListeners();
  }
}
