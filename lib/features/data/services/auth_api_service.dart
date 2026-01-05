import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/network/api_config.dart';
import '../../../core/network/token_storage.dart';

class AuthApiService {
  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConfig.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode == 200 && body['success'] == true) {
      final token = body['data']['token'];
      await TokenStorage.saveToken(token);
    } else {
      throw Exception(body['message'] ?? 'Login failed');
    }
  }
}