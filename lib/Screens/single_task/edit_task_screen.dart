import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import "package:date_picker_timeline/date_picker_timeline.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/commons/alert_dialog.dart';
import 'package:task_management/widgets/commons/custom_create_button.dart';
import 'package:task_management/widgets/commons/custom_create_text_field.dart';

import '../../widgets/commons/custom_create_button.dart';

class EditTaskScreen extends StatefulWidget {
  static const routeName = '/edit_task_screen';
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late DateTime _selectedValue;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteFontColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          'Edit Task',
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
                        _selectedValue = date;
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

              const HeadingText(
                title: 'Priority *',
              ),
              //priority drop down
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

              const HeadingText(
                title: 'Select Category *',
              ),
              //category drop down
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
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SizedBox(
                  height: 40.h,
                  width: 120.w,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Row(
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
                      onPressed: () {
                        Navigator.pop(context);
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
