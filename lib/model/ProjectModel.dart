import 'package:json_annotation/json_annotation.dart';
import 'package:task_management/model/TaskModel.dart';

part 'ProjectModel.g.dart';

@JsonSerializable()
class ProjectModel {
  final String projectId;
  final String userId;
  final DateTime createdDateTime;
  final DateTime? completedDateTime;
  final String title;
  final String description;
  final bool isPending;
  List<TaskModel>? tasks;
  List<FileModel>? files;
  List<String>? comments;

  ProjectModel(
      {required this.projectId,
      required this.userId,
      required this.createdDateTime,
      this.completedDateTime,
      required this.title,
      required this.description,
      required this.isPending,
      this.files,
      this.comments,
      this.tasks});

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
