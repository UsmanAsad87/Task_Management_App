import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/model/TaskModel.dart';

import 'package:task_management/resources/storage_methods.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../provider/task_provider.dart';

class TaskMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String fileName) async {
    final path = 'tasks/${_auth.currentUser!.uid}/$fileName';
    final ref = _storage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snap = await uploadTask.whenComplete(() {});
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<TaskModel> getTaskDetails(String taskId) async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('tasks')
        .doc(taskId)
        .get();
    return TaskModel.fromJson(snap.data() as Map<String, dynamic>);
  }

  //sign up user
  Future<String> createTask({
    required String userId,
    required DateTime dueTime,
    required String title,
    required String desc,
    required String priorityValue,
    required String categoryValue,
    required BuildContext context,
    required List<FileModel>? uploadFiles,
  }) async {
    String res = "Some error occurred";
    var taskId = '';
    try {
      taskId = const Uuid().v4();
      TaskModel task = TaskModel(
          taskId: taskId,
          userId: userId,
          createdDateTime: DateTime.now(),
          dueDateTime: dueTime,
          title: title,
          description: desc,
          priorityValue: priorityValue,
          categoryValue: categoryValue,
          files: uploadFiles,
          isPending: true);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .set(task.toJson());
      //
      TaskProvider taskProvider = Provider.of(context, listen: false);
      await taskProvider.refreshSelectedTask(taskId);

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateTask({
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

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .update(task.toJson());
      TaskProvider taskProvider = Provider.of(context, listen: false);
      await taskProvider.refreshSelectedTask(taskId);

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

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
