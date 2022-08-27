import 'package:flutter/cupertino.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/resources/task_methods.dart';

class TaskProvider extends ChangeNotifier {
  TaskModel? _selectedTask;
  TaskModel? _subTask;
  final TaskMethods _taskMethods = TaskMethods();

  TaskModel get getSelectedTask => _selectedTask!;
  TaskModel get getSubTask => _subTask!;

  set setSubTask(TaskModel? task) {
    _subTask = task;
    notifyListeners();
  }

  Future<void> refreshSelectedTask(String taskId) async {
    TaskModel task = await _taskMethods.getTaskDetails(taskId);
    _selectedTask = task;
    notifyListeners();
  }
}
