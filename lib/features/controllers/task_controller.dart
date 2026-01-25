import '../models/task_model.dart';

class TaskController {
  static final List<Task> tasks = [];

  static void addTask(Task task) {
    tasks.add(task);
  }

  static List<Task> getTasks() {
    return tasks;
  }
}