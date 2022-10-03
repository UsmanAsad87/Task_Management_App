import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/create_project/create_sub_task_screen.dart';
import 'package:task_management/Screens/single_task/edit_task_screen.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/task_provider.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/project_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/widgets/commons/custom_create_button.dart';
import 'package:task_management/widgets/commons/custom_create_text_field.dart';
import 'package:task_management/widgets/commons/dotted_button.dart';

import '../../model/TaskModel.dart';
import '../../provider/project_provider.dart';
import '../../widgets/single_task/attached_file.dart';

class EditProjectScreen extends StatefulWidget {
  static const routeName = '/edit_project';
  const EditProjectScreen({Key? key}) : super(key: key);

  @override
  State<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  late DateTime _selectedValue;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  List<TaskModel> tasks = [];
  List<FileModel>? uploadFiles = [];

  bool isUploading = false;

  bool _isLoading = true;

  Future selectFile() async {
    setState(() {
      isUploading = true;
    });
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }
    final file = File(result.files.first.path!);
    final fileName = result.files.first.name;
    String fileUrl = await ProjectMethods().uploadFile(file, fileName);
    uploadFiles?.add(FileModel(fileName: fileName, fileUrl: fileUrl));
    setState(() {
      isUploading = false;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectModel project =
        Provider.of<ProjectProvider>(context).getSelectedProject;
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    _titleController.text = project.title;
    _descController.text = project.description;
    //tasks = project.tasks!;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteFontColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          'Edit Project',
          style: kHeadingStyle3,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month,
                color: kWhiteFontColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(
                title: 'Title *',
              ),
              CustomCreateTextField(
                controller: _titleController,
                hintText: 'Web Development',
                onChanged: (val) {},
                onFieldSubmitted: (val) {
                  _titleController.text = val;
                },
                maxLines: 1,
              ),
              const HeadingText(
                title: 'Description *',
              ),
              CustomCreateTextField(
                controller: _descController,
                hintText:
                    'us Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                onChanged: (val) {},
                onFieldSubmitted: (val) {},
                maxLines: 2,
              ),
              const HeadingText(
                title: 'Quick Tasks *',
              ),
              DottedButton(
                  width: (MediaQuery.of(context).size.width / 2) + 10,
                  text: 'Create Sub Task',
                  height: 35.h,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CreateSubTaskScreen(
                                  isFromEditProject: true,
                                )));
                    //Navigator.pushNamed(context, CreateSubTaskScreen.routeName,);
                  }),
              Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                width: double.infinity,
                color: kWhiteFontColor.withOpacity(0.38),
              ),
              if (tasks.isNotEmpty)
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                            task: tasks[index],
                            index: index + 1,
                            title: tasks[index].title,
                            dateTime: tasks[index].dueDateTime);
                      }),
                ),
              if (project.tasks!.isNotEmpty)
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: project.tasks!.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                            task: project.tasks![index],
                            index: index + 1,
                            title: project.tasks![index].title,
                            dateTime: project.tasks![index].dueDateTime);
                      }),
                ),
              // TaskTile(index: 1, title: 'Web Design', dateTime: DateTime.now()),
              // TaskTile(index: 2, title: 'Web Dev', dateTime: DateTime.now()),
              SizedBox(height: 20.h),
              const HeadingText(
                title: 'Attach Files',
              ),
              RawMaterialButton(
                elevation: 0,
                fillColor: kTextFieldColor,
                //splashColor: Colors.greenAccent,
                onPressed: selectFile,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SizedBox(
                  height: 40.h,
                  width: 120.w,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: isUploading
                        ? spinKit()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.upload_outlined,
                                  color: Color(0xFFBFBFBF)),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0.w),
                                child: Text(
                                  'Upload',
                                  style: kBodyStyle6,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (project.files!.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: project.files!.length,
                        itemBuilder: (context, index) {
                          return AttachedFile(
                            filename: project.files![index].fileName!,
                          );
                        }),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCreateButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonText: 'Cancel',
                      fillColor: kSecondaryColor),
                  CustomCreateButton(
                      onPressed: () async {
                        if (_titleController.text.isEmpty ||
                            _descController.text.isEmpty) {
                          showFlagMsg(
                              context: context,
                              msg: 'Required fields are missing',
                              textColor: Colors.red);
                          return null;
                        }
                        setState(() {
                          _isLoading = true;
                        });
                        String res = '';
                        res = await ProjectMethods().updateProject(
                            userId: user.uid,
                            projectId: project.projectId,
                            title: _titleController.text,
                            desc: _descController.text,
                            context: context,
                            tasks: project.tasks,
                            createdDate: project.createdDateTime,
                            isPending: project.isPending,
                            uploadedFiles: project.files,
                            toUploadFiles: uploadFiles);
                        setState(() {
                          _isLoading = false;
                        });
                        if (res != 'success') {
                          showFlagMsg(
                              context: context,
                              msg: res,
                              textColor: Colors.red);
                        } else {
                          showToast('Project Updated Successfully');
                          Navigator.pop(context);
                        }
                      },
                      buttonText: 'Done',
                      fillColor: kPrimaryColor)
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final int index;
  final String title;
  final DateTime dateTime;
  final TaskModel task;
  const TaskTile({
    Key? key,
    required this.index,
    required this.title,
    required this.dateTime,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(100.r)),
                child: Center(
                    child: Text(
                  index.toString(),
                  style: kBodyStyle5,
                )),
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                  width: 120.w,
                  child: Text(
                    title,
                    style: kBodyStyle14,
                  )),
            ],
          ),
          Text(
            DateFormat.yMd().format(dateTime),
            style: kBodyStyle14,
          ),
          InkWell(
            onTap: () {
              Provider.of<TaskProvider>(context, listen: false).setSubTask =
                  task;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditTaskScreen(
                            isProjectTask: true,
                          )));
              //Navigator.pushNamed(context, EditTaskScreen.routeName);
            },
            child: const Icon(
              Icons.edit_outlined,
              color: kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: kHeadingStyle4,
      ),
    );
  }
}
