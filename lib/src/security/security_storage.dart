import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage {
// Create storage
  static const storage = FlutterSecureStorage();

// Read value
  static Future<String> read(String key) async {
    String value = await storage.read(key: key) ?? "";
    return value;
  }

// Delete value
  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

// Delete all
  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }

// Write value
  static Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
