import 'package:flutter/cupertino.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/resources/project_methods.dart';
import 'package:task_management/resources/task_methods.dart';

class ProjectProvider extends ChangeNotifier {
  ProjectModel? _selectedProject;
  String projectTitle = '';
  String projectDesc = '';
  final ProjectMethods _projectMethods = ProjectMethods();

  ProjectModel get getSelectedProject => _selectedProject!;

  String get getProjectTitle => projectTitle;
  String get getProjectDesc => projectDesc;
  set setProjectTitle(String title) {
    projectTitle = title;
    notifyListeners();
  }

  set setProjectDesc(String desc) {
    projectDesc = desc;
    notifyListeners();
  }

  Future<void> refreshSelectedProject(String projectId) async {
    ProjectModel project = await _projectMethods.getProjectDetails(projectId);
    _selectedProject = project;
    notifyListeners();
  }
}
