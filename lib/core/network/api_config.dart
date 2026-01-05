class ApiConfig {
  static const String baseUrl = 'http://143.110.241.146:8000';

  // AUTH
  static const String register = '$baseUrl/user/register';
  static const String sendOtp = '$baseUrl/user/send-otp';
  static const String verifyOtp = '$baseUrl/user/activate-user';
  static const String login = '$baseUrl/user/login';

  // PROFILE
  static const String profile = '$baseUrl/user/my-profile';
  static const String updateProfile = '$baseUrl/user/update-profile';

  // TASK
  static const String getTasks = '$baseUrl/task/get-all-task';
  static const String createTask = '$baseUrl/task/create-task';
  static String deleteTask(String id) => '$baseUrl/task/delete-task/$id';
}