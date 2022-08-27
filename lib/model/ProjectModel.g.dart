// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      completedDateTime: json['completedDateTime'] == null
          ? null
          : DateTime.parse(json['completedDateTime'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      isPending: json['isPending'] as bool,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'userId': instance.userId,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'completedDateTime': instance.completedDateTime?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'isPending': instance.isPending,
      'tasks': instance.tasks?.map((e) => e.toJson()).toList(),
      'files': instance.files?.map((e) => e.toJson()).toList(),
      'comments': instance.comments,
    };

// ?.map((e) => e.toJson()).toList()
