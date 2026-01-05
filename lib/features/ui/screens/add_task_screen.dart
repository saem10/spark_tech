import 'package:flutter/material.dart';
import '../../data/services/task_api_service.dart';

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

  final TaskApiService _taskService = TaskApiService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Task Title', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _titleTEController,
                validator: (value) =>
                value!.isEmpty ? 'Title is required' : null,
                decoration: const InputDecoration(
                  hintText: 'e.g. Design Landing Page',
                ),
              ),

              const SizedBox(height: 16),

              const Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _descriptionTEController,
                validator: (value) =>
                value!.isEmpty ? 'Description is required' : null,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Task details',
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitTask,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitTask() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _taskService.createTask(
        _titleTEController.text.trim(),
        _descriptionTEController.text.trim(),
      );

      Navigator.pop(context, true); // refresh HomeScreen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}