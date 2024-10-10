import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class UpdateTaskScreen extends StatefulWidget {
  final Task task;

  UpdateTaskScreen({required this.task});

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _taskController.text = widget.task.title;
  }

  void _updateTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      taskProvider.updateTask(Task(
        id: widget.task.id,
        title: taskText,
        isDone: widget.task.isDone,
      ));
      Navigator.of(context).pop(); 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task updated!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _updateTask(context),
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
