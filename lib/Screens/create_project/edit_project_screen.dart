import 'package:flutter/material.dart';
import 'package:task_management/Screens/create_project/create_sub_task_screen.dart';
import 'package:task_management/Screens/single_task/edit_task_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/commons/custom_create_button.dart';
import 'package:task_management/widgets/commons/custom_create_text_field.dart';
import 'package:task_management/widgets/commons/dotted_button.dart';

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

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushNamed(context, CreateSubTaskScreen.routeName);
                  }),
              Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                width: double.infinity,
                color: kWhiteFontColor.withOpacity(0.38),
              ),
              TaskTile(index: 1, title: 'Web Design', dateTime: DateTime.now()),
              TaskTile(index: 2, title: 'Web Dev', dateTime: DateTime.now()),
              SizedBox(height: 20.h),
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
              SizedBox(
                height: 20.h,
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditTaskScreen.routeName);
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
