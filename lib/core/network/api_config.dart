class ApiConfig {
  static const String baseUrl = 'http://143.110.241.146:8000';

  // Auth
  static const String login = '$baseUrl/user/login';
  static const String profile = '$baseUrl/user/my-profile';
  static const String updateProfile = '$baseUrl/user/update-profile';

  // Task
  static const String getTasks = '$baseUrl/task/get-all-task';
  static const String createTask = '$baseUrl/task/create-task';
  static String deleteTask(String id) => '$baseUrl/task/delete-task/$id';
}
