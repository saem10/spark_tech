import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/network/api_config.dart';
import '../../../core/network/token_storage.dart';
import '../models/task_model.dart';

class TaskApiService {
  Map<String, String> get _headers {
    if (TokenStorage.token == null) {
      throw Exception('Authentication token not found');
    }
    return {
      'Authorization': 'Bearer ${TokenStorage.token}',
      'Content-Type': 'application/json',
    };
  }

  // ================= GET TASKS =================
  Future<List<TaskModel>> getAllTasks() async {
    final response = await http.get(
      Uri.parse(ApiConfig.getTasks),
      headers: _headers,
    );

    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200 && body['success'] == true) {
      final List tasks = body['data']?['myTasks'] ?? [];
      return tasks.map((e) => TaskModel.fromJson(e)).toList();
    } else {
      throw Exception(body['message'] ?? 'Failed to load tasks');
    }
  }

  // ================= CREATE TASK =================
  Future<void> createTask(String title, String description) async {
    final response = await http.post(
      Uri.parse(ApiConfig.createTask),
      headers: _headers,
      body: jsonEncode({
        'title': title,
        'description': description,
      }),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(body['message'] ?? 'Failed to create task');
    }
  }

  // ================= DELETE TASK =================
  Future<void> deleteTask(String id) async {
    final response = await http.delete(
      Uri.parse(ApiConfig.deleteTask(id)),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      final body = jsonDecode(response.body);
      throw Exception(body['message'] ?? 'Failed to delete task');
    }
  }
}
