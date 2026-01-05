import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static String? token;

  static Future<void> saveToken(String newToken) async {
    token = newToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);
  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token = null;
  }
}