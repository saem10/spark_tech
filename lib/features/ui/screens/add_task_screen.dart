import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spark_tech/features/ui/screens/home_screen.dart';
import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import 'main_screen.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static const String name = '/add-new-task-screen';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Add Task', style: textTheme.titleLarge))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  'Task Title',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    hintText: "e.g. Design Landing Page Header",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Task title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEController,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Noakhali, Bangladesh",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    final task = Task(
                      title: _titleTEController.text.trim(),
                      description: _descriptionTEController.text.trim(),
                      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    );
                    TaskController.addTask(task);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                          (route) => false,
                    );

                  },
                  child: const Text('Save Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}