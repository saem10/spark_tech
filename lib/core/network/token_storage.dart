import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static String? token;

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  static Future<void> saveToken(String newToken) async {
    final prefs = await SharedPreferences.getInstance();
    token = newToken;
    await prefs.setString('token', newToken);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = null;
    await prefs.remove('token');
  }
}
