import 'package:flutter/material.dart';

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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "e.g. Design Leading Page Header"),
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
                  onPressed: () {},
                  child: Text('Save Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.deactivate();
  }
}
