import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../core/network/api_config.dart';
import '../../../core/network/token_storage.dart';

class ProfileApiService {
  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    File? image,
  }) async {
    if (TokenStorage.token == null) {
      throw Exception('User not authenticated');
    }

    final request = http.MultipartRequest(
      'PATCH',
      Uri.parse(ApiConfig.updateProfile),
    );

    request.headers['Authorization'] =
    'Bearer ${TokenStorage.token}';

    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;

    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath('file', image.path),
      );
    }

    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Profile update failed');
    }
  }
}