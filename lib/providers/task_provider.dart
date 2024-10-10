
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  updateTask(Task updateTask) {
    final index = _tasks.indexWhere((to) => to.id == updateTask.id);
    if (index != -1) {
      _tasks[index] = updateTask;
      notifyListeners();
    }
      }


 void updateCheckBox(String id ) {
  final index = _tasks.indexWhere((task) => task.id == id);
  if (index != -1) {
    final currentTask = _tasks[index];
    _tasks[index] = Task(
      id: currentTask.id,
      title: currentTask.title,
      isDone: !currentTask.isDone, 
    );
    notifyListeners();
  }
}

}
