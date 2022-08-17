import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import "package:date_picker_timeline/date_picker_timeline.dart";
import 'package:task_management/widgets/all_projects/card_all_projects.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProjectsScreen extends StatefulWidget {
  static const routeName = '/all-project-screen';
  const AllProjectsScreen({Key? key}) : super(key: key);

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  late DateTime _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: const BackButton(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text(
          'All Projects',
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
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
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
              SizedBox(height: 20.h),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              const CardAllProject(
                  projectTitle: 'Management App Design',
                  projectType: 'Design',
                  noOfComments: 2,
                  progressPercent: 0.5),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
