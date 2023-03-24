import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:provider/provider.dart';
import 'package:task_management/provider/project_provider.dart';
import 'package:uuid/uuid.dart';
import '../provider/task_provider.dart';

class ProjectMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String fileName) async {
    final path = 'projects/${_auth.currentUser!.uid}/$fileName';
    final ref = _storage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    TaskSnapshot snap = await uploadTask.whenComplete(() {});
    String downloadUrl = await snap.ref.getDownloadURL();
    print(downloadUrl);

    return downloadUrl;
  }

  Future<ProjectModel> getProjectDetails(String projectId) async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('projects')
        .doc(projectId)
        .get();
    return ProjectModel.fromJson(snap.data() as Map<String, dynamic>);
  }

  Future<String> createProject({
    required String userId,
    required String title,
    required String desc,
    required BuildContext context,
    required List<TaskModel>? tasks,
    required List<FileModel>? uploadFiles,
  }) async {
    String res = "Some error occurred";
    var projectId = '';
    try {
      projectId = const Uuid().v4();
      ProjectModel project = ProjectModel(
          projectId: projectId,
          userId: userId,
          createdDateTime: DateTime.now(),
          title: title,
          description: desc,
          isPending: true,
          tasks: tasks,
          files: uploadFiles);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(projectId)
          .set(project.toJson());

      ProjectProvider projectProvider = Provider.of(context, listen: false);
      await projectProvider.refreshSelectedProject(projectId);

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateProject({
    required String userId,
    required String projectId,
    required String title,
    required String desc,
    required BuildContext context,
    required List<TaskModel>? tasks,
    required DateTime createdDate,
    required bool isPending,
    required List<FileModel>? uploadedFiles,
    required List<FileModel>? toUploadFiles,
  }) async {
    String res = "Some error occurred";
    try {
      for (var element in toUploadFiles!) {
        uploadedFiles!.add(element);
      }
      ProjectModel project = ProjectModel(
          projectId: projectId,
          userId: userId,
          createdDateTime: createdDate,
          title: title,
          description: desc,
          isPending: isPending,
          tasks: tasks,
          files: uploadedFiles);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(projectId)
          .update(project.toJson());

      ProjectProvider projectProvider = Provider.of(context, listen: false);
      await projectProvider.refreshSelectedProject(projectId);

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
  Future<String> createProjectTaskFromEdit({
    required String userId,
    required TaskModel task,
    required BuildContext context,
  }) async {
    final ProjectModel project =
        Provider.of<ProjectProvider>(context, listen: false).getSelectedProject;
    String res = "Some error occurred";
    try {
      project.tasks!.add(task);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(project.projectId)
          .update(project.toJson());
      ProjectProvider projectProvider = Provider.of(context, listen: false);
      await projectProvider.refreshSelectedProject(project.projectId);
      Provider.of<TaskProvider>(context, listen: false).setSubTask = task;

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateProjectTask({
    required String userId,
    required String taskId,
    required DateTime dueTime,
    required String title,
    required String desc,
    required String priorityValue,
    required String categoryValue,
    required List<FileModel>? uploadedFiles,
    required List<FileModel>? toUploadFiles,
    required BuildContext context,
  }) async {
    final ProjectModel project =
        Provider.of<ProjectProvider>(context, listen: false).getSelectedProject;
    String res = "Some error occurred";
    try {
      for (var element in toUploadFiles!) {
        uploadedFiles!.add(element);
      }
      TaskModel task = TaskModel(
          taskId: taskId,
          userId: userId,
          createdDateTime: DateTime.now(),
          dueDateTime: dueTime,
          title: title,
          description: desc,
          priorityValue: priorityValue,
          categoryValue: categoryValue,
          files: uploadedFiles,
          isPending: true);

      for (var element in project.tasks!) {
        if (element.taskId == taskId) {
          project.tasks!.remove(element);
          break;
        }
      }
      project.tasks!.add(task);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('projects')
          .doc(project.projectId)
          .update(project.toJson());
      ProjectProvider projectProvider = Provider.of(context, listen: false);
      await projectProvider.refreshSelectedProject(project.projectId);
      Provider.of<TaskProvider>(context, listen: false).setSubTask = task;

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
  //
  // Future<String> updateTask({
  //   required String userId,
  //   required String taskId,
  //   required DateTime dueTime,
  //   required String title,
  //   required String desc,
  //   required String priorityValue,
  //   required String categoryValue,
  //   required List<FileModel>? uploadedFiles,
  //   required List<FileModel>? toUploadFiles,
  //   required BuildContext context,
  // }) async {
  //   String res = "Some error occurred";
  //   try {
  //     for (var element in toUploadFiles!) {
  //       uploadedFiles!.add(element);
  //     }
  //     TaskModel task = TaskModel(
  //         taskId: taskId,
  //         userId: userId,
  //         createdDateTime: DateTime.now(),
  //         dueDateTime: dueTime,
  //         title: title,
  //         description: desc,
  //         priorityValue: priorityValue,
  //         categoryValue: categoryValue,
  //         files: uploadedFiles,
  //         isPending: true);
  //
  //     await _firestore
  //         .collection('users')
  //         .doc(userId)
  //         .collection('tasks')
  //         .doc(taskId)
  //         .update(task.toJson());
  //     TaskProvider taskProvider = Provider.of(context, listen: false);
  //     await taskProvider.refreshSelectedTask(taskId);
  //
  //     res = 'success';
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //
  //   return res;
  // }

  // Future<String> updateUsername({
  //   required String username,
  //   required BuildContext context,
  // }) async {
  //   String res = "some error occurred";
  //   try {
  //     await _firestore
  //         .collection('users')
  //         .doc(_auth.currentUser!.uid)
  //         .update({'name': username});
  //     UserProvider _userProvider = Provider.of(context, listen: false);
  //     await _userProvider.refreshUser();
  //     res = 'success';
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

}
