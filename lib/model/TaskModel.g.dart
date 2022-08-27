// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      taskId: json['taskId'] as String,
      userId: json['userId'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      dueDateTime: DateTime.parse(json['dueDateTime'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      priorityValue: json['priorityValue'] as String,
      categoryValue: json['categoryValue'] as String,
      isPending: json['isPending'] as bool,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'userId': instance.userId,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'dueDateTime': instance.dueDateTime.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'priorityValue': instance.priorityValue,
      'categoryValue': instance.categoryValue,
      'isPending': instance.isPending,
      'files': instance.files?.map((e) => e.toJson()).toList(),
      'comments': instance.comments,
    };
