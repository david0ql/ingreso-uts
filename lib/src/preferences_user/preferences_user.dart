import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static String _photo = "";
  static String _correo = "";
  static String _nombre = "";
  static String _id = "";
  static String _job = "";

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

  static String get photo {
    return _prefs.getString("photo") ?? _photo;
  }

  static set photo(String value) {
    _photo = value;
    _prefs.setString("photo", value);
  }

  static String get nombre {
    return _prefs.getString("nombre") ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString("nombre", value);
  }

  static String get id {
    return _prefs.getString("id") ?? _id;
  }

  static set id(String value) {
    _id = value;
    _prefs.setString("id", value);
  }

  static String get job {
    return _prefs.getString("job") ?? _job;
  }

  static set job(String value) {
    _job = value;
    _prefs.setString("job", value);
  }
}
