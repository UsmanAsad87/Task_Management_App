import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/task_provider.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/task_methods.dart';
import 'package:task_management/utils/constants.dart';
import "package:date_picker_timeline/date_picker_timeline.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/widgets/commons/custom_create_button.dart';
import 'package:task_management/widgets/commons/custom_create_text_field.dart';
import 'package:task_management/widgets/single_task/attached_file.dart';
import 'package:uuid/uuid.dart';

class CreateSubTaskScreen extends StatefulWidget {
  static const routeName = '/edit_sub_task';
  const CreateSubTaskScreen({Key? key,}) : super(key: key);

  @override
  State<CreateSubTaskScreen> createState() => _CreateSubTaskScreenState();
}

class _CreateSubTaskScreenState extends State<CreateSubTaskScreen> {
  late DateTime _selectedDueDate;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  bool isUploading = false;
  List<FileModel>? uploadFiles = [];

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  String priorityValue = "High";
  String categoryValue = "Design";

  List<DropdownMenuItem<String>> prioirityItems = [
    DropdownMenuItem(child: Text("High"), value: "High"),
    DropdownMenuItem(child: Text("Normal"), value: "Normal"),
    DropdownMenuItem(child: Text("Low"), value: "Low"),
  ];
  List<DropdownMenuItem<String>> categoryItems = [
    DropdownMenuItem(child: Text("Design"), value: "Design"),
    DropdownMenuItem(child: Text("Design 1"), value: "Design 1"),
    DropdownMenuItem(child: Text("Design 3"), value: "Design 3"),
    DropdownMenuItem(child: Text("Design 4"), value: "Design 4"),
  ];
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
    String fileUrl = await TaskMethods().uploadFile(file, fileName);
    uploadFiles?.add(FileModel(fileName: fileName, fileUrl: fileUrl));
    setState(() {
      isUploading = false;
    });
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
          'Create Sub-Task',
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
                title: 'Select Due Date',
              ),
              SizedBox(
                height: 10.h,
              ),
              //date_day
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: kPrimaryColor,
                    selectedTextColor: kFontColor1,
                    monthTextStyle: kDayStyle,
                    dateTextStyle: kDateStyle,
                    dayTextStyle: kDayStyle,
                    // height: 150.h,
                    width: 50.w,
                    onDateChange: (date) {
                      setState(() {
                        _selectedDueDate = date;
                      });
                    },
                  ),
                ],
              ),
              Container(
                height: 2.h,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                width: double.infinity,
                color: kWhiteFontColor.withOpacity(0.38),
              ),
              const HeadingText(
                title: 'Title *',
              ),

              CustomCreateTextField(
                controller: _titleController,
                hintText: 'Web Design',
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

              //priority drop down
              const HeadingText(
                title: 'Priority *',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: kTextFieldColor,
                ),
                padding: EdgeInsets.all(9.h),
                height: 40.h,
                width: 150.h,
                child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: kTextFieldColor,
                    borderRadius: BorderRadius.circular(12),
                    underline: SizedBox(),
                    value: priorityValue,
                    focusColor: Colors.white,
                    style: kDropDownStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        priorityValue = newValue!;
                      });
                    },
                    items: prioirityItems),
              ),

              //Category drop down
              const HeadingText(
                title: 'Select Category *',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: kTextFieldColor,
                ),
                padding: EdgeInsets.all(9.h),
                height: 40.h,
                width: 150.h,
                child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: kTextFieldColor,
                    borderRadius: BorderRadius.circular(12),
                    underline: SizedBox(),
                    value: categoryValue,
                    focusColor: Colors.blue,
                    style: kDropDownStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryValue = newValue!;
                      });
                    },
                    items: categoryItems),
              ),

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
              SizedBox(height: 20.h),
              if (uploadFiles!.isNotEmpty)
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: uploadFiles!.length,
                      itemBuilder: (context, index) {
                        return AttachedFile(
                          filename: uploadFiles![index].fileName!,
                        );
                      }),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCreateButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      buttonText: 'Cancel',
                      fillColor: kSecondaryColor),
                  CustomCreateButton(
                      onPressed: () async {
                        if (_titleController.text.isEmpty ||
                            _descController.text.isEmpty ||
                            _selectedDueDate == null) {
                          showFlagMsg(
                              context: context,
                              msg: 'Required fields are missing',
                              textColor: Colors.red);
                          return null;
                        }
                        setState(() {
                          _isLoading = true;
                        });
                        var taskId = const Uuid().v4();
                        TaskModel task = TaskModel(
                            taskId: taskId,
                            userId: user.uid,
                            createdDateTime: DateTime.now(),
                            dueDateTime: _selectedDueDate,
                            title: _titleController.text,
                            description: _descController.text,
                            priorityValue: priorityValue,
                            categoryValue: categoryValue,
                            files: uploadFiles,
                            isPending: true);
                        setState(() {
                          _isLoading = false;
                        });
                        Provider.of<TaskProvider>(context, listen: false)
                            .setSubTask = task;
                        Navigator.pop(context, true);
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

// SizedBox(
// width: 150,
// //height: 40,
// child: DropdownButtonFormField<String>(
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// borderSide:  BorderSide(color: Colors.black.withOpacity(0.1)),
// ),
// ),
// style: kBodyStyle6,
// value: selectedValue,
// icon: const Icon(Icons.arrow_drop_down_outlined),
// items: items.map((String items) {
// return DropdownMenuItem(
// value: items,
// child: Text(items,style: kBodyStyle6,),
// );
// }).toList(),
// onChanged: (String? newValue) {
// setState(() {
// selectedValue = newValue!;
// });
// },
// ),
// ),
