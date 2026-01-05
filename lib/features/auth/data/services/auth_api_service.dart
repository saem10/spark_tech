import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/token_storage.dart';

class AuthApiService {
  static const String baseUrl = 'http://143.110.241.146:8000';

  /// REGISTER
  static Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String address,
  }) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/user/register'),
    );

    request.fields.addAll({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'address': address,
    });

    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();

    final body = jsonDecode(responseBody);

    debugPrint('REGISTER RESPONSE: $body');

    if (streamedResponse.statusCode != 200 ||
        body['status'] != 'Success') {
      throw Exception(body['message'] ?? 'Registration failed');
    }
  }


  /// VERIFY OTP (ACTIVATE USER)
  static Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/activate-user'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'code': otp,
      }),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(body['message'] ?? 'OTP verification failed');
    }
  }

  /// LOGIN
  static Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      await TokenStorage.saveToken(body['data']['token']);
    } else {
      throw Exception(body['message'] ?? 'Login failed');
    }
  }
}
