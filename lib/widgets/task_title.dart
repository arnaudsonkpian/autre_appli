import '../models/task.dart';
import 'package:autre_appli/screens/update_task_screen.dart';
import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  final bool isDone;
  final Task task;
  final Function(bool?) onChanged;
  final Function()? onDelete;
  final Function()? updateTask;
  final String id;

  TaskTitle(
      {required this.title,
      required this.isDone,
      required this.onDelete,
      required this.onChanged,
      required this.updateTask,
      required this.id,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style:
            TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(value: isDone, onChanged: onChanged),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context)=>UpdateTaskScreen(task: task)
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
