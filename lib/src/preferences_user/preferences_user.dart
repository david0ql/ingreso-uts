import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static String _correo = "";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get correo {
    return _prefs.getString("correo") ?? _correo;
  }

  static set correo(String value) {
    _correo = value;
    _prefs.setString("correo", value);
  }
}
