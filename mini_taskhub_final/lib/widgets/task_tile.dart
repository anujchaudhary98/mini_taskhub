import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final dynamic task;
  final void Function(String) onDelete;

  const TaskTile({required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task['title']),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => onDelete(task['id']),
      ),
    );
  }
}
