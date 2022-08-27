import 'package:json_annotation/json_annotation.dart';

part 'TaskModel.g.dart';

@JsonSerializable()
class TaskModel {
  final String taskId;
  final String userId;
  final DateTime createdDateTime;
  final DateTime dueDateTime;
  final String title;
  final String description;
  final String priorityValue;
  final String categoryValue;
  final bool isPending;
  List<FileModel>? files;
  List<String>? comments;

  TaskModel(
      {required this.taskId,
      required this.userId,
      required this.createdDateTime,
      required this.dueDateTime,
      required this.title,
      required this.description,
      required this.priorityValue,
      required this.categoryValue,
      required this.isPending,
      this.files,
      this.comments});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

class FileModel {
  String? fileName;
  String? fileUrl;

  FileModel({this.fileName, this.fileUrl});

  FileModel.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['fileUrl'] = fileUrl;
    return data;
  }
}
