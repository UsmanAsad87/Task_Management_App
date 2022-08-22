import 'package:flutter/material.dart';
import 'package:task_management/Screens/projects/single_project_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/all_projects/card_project_task.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/auth/custom_button.dart';

class ProjectScreen extends StatefulWidget {
  final bool isPending;
  final String title;
  static const routeName = '/project-screen';
  const ProjectScreen({Key? key, required this.title, this.isPending = true})
      : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late DateTime _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          widget.title,
          style: kHeadingStyle3,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month,
                color: kWhiteColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              CardProjectTask(
                projectTitle: 'Management App Design',
                projectType: 'Design',
                noOfComments: 2,
                isPending: widget.isPending,
              ),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              CardProjectTask(
                projectTitle: 'Web Dev',
                projectType: 'Web Development',
                noOfComments: 2,
                isPending: widget.isPending,
              ),
              const DottedDashedLine(
                height: 0,
                width: double.maxFinite,
                axis: Axis.horizontal,
                dashColor: kFontColor2,
              ),
              CardProjectTask(
                projectTitle: 'Web Design',
                projectType: 'Design',
                noOfComments: 2,
                isPending: widget.isPending,
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SingleProjectScreen(
                                title: widget.title,
                                isPending: widget.isPending,
                              )));
                },
                buttonText: 'View Project Details',
                fillColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
