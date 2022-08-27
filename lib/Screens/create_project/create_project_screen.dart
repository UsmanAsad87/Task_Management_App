import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/projects/project.dart';
import 'package:task_management/Screens/create_project/create_sub_task_screen.dart';
import 'package:task_management/Screens/single_task/create_task_screen.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/project_provider.dart';
import 'package:task_management/provider/task_provider.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/project_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/widgets/commons/alert_dialog.dart';
import 'package:task_management/widgets/commons/custom_create_button.dart';
import 'package:task_management/widgets/commons/custom_create_text_field.dart';
import 'package:task_management/widgets/commons/dotted_button.dart';

class CreateProjectScreen extends StatefulWidget {
  static const routeName = '/create_project';
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  late DateTime _selectedValue;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  List<FileModel>? uploadFiles = [];
  bool _isLoading = false;
  List<TaskModel> tasks = [];

  showTaskCreatedDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            actions: [
              AlertBox(
                  text: 'You’ve successfully \n created a project',
                  buttonText: 'View Project',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, ProjectScreen.routeName);
                  }),
            ],
          );
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
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteFontColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          'Create Project',
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
                title: 'Select Type',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DottedButton(
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      text: 'Create Task',
                      height: 20.h,
                      onPress: () {
                        Navigator.pushNamed(
                            context, CreateTaskScreen.routeName);
                      }),
                  CustomCreateButton(
                      onPressed: () {},
                      buttonText: 'Create Project',
                      fillColor: kPrimaryColor)
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                width: double.infinity,
                color: kWhiteFontColor.withOpacity(0.38),
              ),
              const HeadingText(
                title: 'Title *',
              ),
              CustomCreateTextField(
                controller: _titleController,
                hintText: 'Web Development',
                onChanged: (val) {},
                onFieldSubmitted: (val) {},
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
                    // Provider.of<ProjectProvider>(context, listen: false).projectTitle = _titleController.text;
                    // Provider.of<ProjectProvider>(context, listen: false).projectDesc = _descController.text;
                    Navigator.pushNamed(context, CreateSubTaskScreen.routeName)
                        .then((value) {
                      if (value == true) {
                        TaskModel newTask =
                            Provider.of<TaskProvider>(context, listen: false)
                                .getSubTask;
                        tasks.add(newTask);
                        setState(() {});
                        // _titleController.text=Provider.of<ProjectProvider>(context, listen: false).getProjectTitle;
                        // _descController.text=Provider.of<ProjectProvider>(context, listen: false).getProjectDesc;
                      }
                    });
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
                            index: index + 1,
                            title: tasks[index].title,
                            dateTime: tasks[index].dueDateTime);
                      }),
                ),

              // TaskTile(index: 1, title: 'Web Design', dateTime: DateTime.now()),
              // TaskTile(index: 2, title: 'Web Dev', dateTime: DateTime.now()),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCreateButton(
                      onPressed: () {},
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
                        String res = await ProjectMethods().createProject(
                            userId: user.uid,
                            title: _titleController.text,
                            desc: _descController.text,
                            context: context,
                            tasks: tasks,
                            uploadFiles: uploadFiles);
                        setState(() {
                          _isLoading = false;
                        });
                        if (res != 'success') {
                          showFlagMsg(
                              context: context,
                              msg: res,
                              textColor: Colors.red);
                        } else {
                          _titleController.text = '';
                          _descController.text = '';
                          showTaskCreatedDialog();
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
  const TaskTile({
    Key? key,
    required this.index,
    required this.title,
    required this.dateTime,
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
          Icon(
            Icons.edit_outlined,
            color: kWhiteColor,
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
