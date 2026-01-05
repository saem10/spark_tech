import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/network/token_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenStorage.loadToken();
  runApp(const TaskManager());
}
