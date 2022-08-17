import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import "package:date_picker_timeline/date_picker_timeline.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/create_project/custom_create_button.dart';
import 'package:task_management/widgets/create_project/custom_create_text_field.dart';

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
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: const BackButton(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
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
                color: kPrimaryColor,
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
                    selectedTextColor: kWhiteColor,
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
                color: Color(0x004064).withOpacity(0.1),
              ),
              const HeadingText(
                title: 'Title',
              ),

              CustomCreateTextField(
                controller: _titleController,
                hintText: 'Web Design',
                onChanged: (val) {},
                onFieldSubmitted: (val) {},
                maxLines: 1,
              ),
              const HeadingText(
                title: 'Title',
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
                title: 'Priority',
              ),

              //priority drop down
              SizedBox(
                height: 40.h,
                width: 150.h,
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.1)),
                      ),
                    ),
                    value: priorityValue,
                    focusColor: Colors.white,
                    style: kBodyStyle6,
                    onChanged: (String? newValue) {
                      setState(() {
                        priorityValue = newValue!;
                      });
                    },
                    items: prioirityItems),
              ),

              const HeadingText(
                title: 'Select Category',
              ),
              //priority drop down
              SizedBox(
                height: 40.h,
                width: 150.h,
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.1)),
                      ),
                    ),
                    value: categoryValue,
                    focusColor: Colors.white,
                    style: kBodyStyle6,
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
                fillColor: Colors.white,
                //splashColor: Colors.greenAccent,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(width: 2.w, color: kInactiveTabColor),
                ),
                child: SizedBox(
                  height: 40.h,
                  width: 120.w,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_outlined,
                            color: const Color(0xFF8D8D8D)),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCreateButton(
                      onPressed: () {},
                      buttonText: 'Cancel',
                      fillColor: Colors.white),
                  CustomCreateButton(
                      onPressed: () {},
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
