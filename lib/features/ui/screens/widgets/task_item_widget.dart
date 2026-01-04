import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;

  const TaskItemWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description will be here'),
            const Text('Date: 8/9/2025'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(
                  label: Text('New'),
                  backgroundColor: Colors.lightBlueAccent,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}