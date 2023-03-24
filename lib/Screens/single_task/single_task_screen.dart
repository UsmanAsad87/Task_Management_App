import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/comments/comments_screen.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/provider/task_provider.dart';
import 'package:task_management/resources/task_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/widgets/single_task/attached_file.dart';
import 'package:task_management/widgets/single_task/custom_small_button.dart';

import '../../widgets/commons/custom_create_button.dart';
import 'edit_task_screen.dart';

class SingleTaskScreen extends StatefulWidget {
  final bool isProjectTask;
  static const routeName = '/single_task_screen';
  const SingleTaskScreen({
    Key? key,
    this.isProjectTask = false,
  }) : super(key: key);

  @override
  _SingleTaskScreenState createState() => _SingleTaskScreenState();
}

class _SingleTaskScreenState extends State<SingleTaskScreen> {
  bool _isLoading = false;
  bool _isFileLoading = false;
  TaskModel? _task;

  @override
  void initState() {
    super.initState();
  }

  Future openFile({required String url, required String fileName}) async {
    setState(() {
      _isFileLoading = true;
    });
    final file = await downloadFile(url, fileName);
    setState(() {
      _isFileLoading = false;
    });
    if (file == null) return;

    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    TaskModel _task;
    if (widget.isProjectTask) {
      _task = Provider.of<TaskProvider>(context).getSubTask;
    } else {
      _task = Provider.of<TaskProvider>(context).getSelectedTask;
    }
    //final TaskModel _task = Provider.of<TaskProvider>(context).getSelectedTask;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kFontColor1),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: _isLoading
          ? spinKit(color: kSecondaryColor)
          : Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: (size.height * 0.25) - 30,
                  child: Container(
                    height: size.height - (size.height * 0.3),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(35.r),topLeft: Radius.circular(35.r)),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10),
                            height: 5.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: kWhiteColor.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _task.title,
                                    style: kHeadingStyle3,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                CustomSmallButton(
                                    onPressed: () {},
                                    buttonText: 'Task',
                                    fillColor: kTextFieldColor,
                                    textColor: Colors.white),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _task.description,
                              style: kTextButtonInActiveStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                CustomSmallButton(
                                    onPressed: () {},
                                    buttonText: _task.categoryValue,
                                    fillColor: kPrimaryColor,
                                    textColor: const Color(0xFF1B1B1B)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CustomSmallButton(
                                    onPressed: () {},
                                    buttonText: _task.priorityValue,
                                    fillColor: kTextFieldColor,
                                    textColor: Colors.white),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CustomSmallButton(
                                    onPressed: () {},
                                    buttonText: _task.isPending
                                        ? 'Pending'
                                        : 'Completed',
                                    fillColor: _task.isPending
                                        ? const Color(0xFF1D95E9)
                                        : const Color(0xFF499B0D),
                                    textColor: Colors.white)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Due Date',
                                style: kBodyStyle13,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                _task.dueDateTime.day.toString(),
                                style: kBodyStyle13,
                              ),
                              Container(
                                height: 50.h,
                                width: 45.w,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 14.h, horizontal: 8.h),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF322B1F),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Text(
                                  months[_task.dueDateTime.month - 1]
                                      .toString(),
                                  style: kBodyStyle5,
                                ),
                              ),
                              Text(
                                _task.dueDateTime.year.toString(),
                                style: kBodyStyle13,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Attachments',
                                style: kBodyStyle13,
                              ),
                            ),
                          ),
                          if (_task.files!.isNotEmpty)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 70.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: _task.files!.length,
                                    itemBuilder: (context, index) {
                                      return AttachedFileButton(
                                        onPress: () => openFile(
                                            fileName:
                                                _task.files![index].fileName!,
                                            url: _task.files![index].fileUrl!),
                                        filename: _task.files![index].fileName!,
                                      );
                                    }),
                              ),
                            ),
                          if (_isFileLoading) spinKit(),
                          if (_task.files!.isEmpty)
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0.w),
                                  child: Text(
                                    'No attached files yet',
                                    style: kTextButtonInActiveStyle,
                                  ),
                                )),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCreateButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, CommentsScreen.routeName);
                                  },
                                  buttonText: 'View Comments',
                                  fillColor: kSecondaryColor),
                              _task.isPending
                                  ? CustomCreateButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => EditTaskScreen(
                                                      isProjectTask:
                                                          widget.isProjectTask,
                                                    )));
                                      },
                                      buttonText: 'Edit',
                                      fillColor: kPrimaryColor)
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
