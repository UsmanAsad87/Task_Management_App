import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/projects/single_project_screen.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/provider/project_provider.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/all_projects/card_project_task.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/auth/custom_button.dart';

class ProjectScreen extends StatefulWidget {
  static const routeName = '/project-screen';
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    final ProjectModel project =
        Provider.of<ProjectProvider>(context).getSelectedProject;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          project.title,
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
              if (project.tasks!.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: project.tasks!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CardProjectTask(
                              task: project.tasks![index],
                            ),
                            if (index != project.tasks!.length - 1)
                              const DottedDashedLine(
                                height: 0,
                                width: double.maxFinite,
                                axis: Axis.horizontal,
                                dashColor: kFontColor2,
                              ),
                          ],
                        );
                      }),
                ),
              if (project.tasks!.isEmpty)
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0.w),
                      child: Text(
                        'No Subtasks Yet',
                        style: kTextButtonInActiveStyle,
                      ),
                    )),
              // CardProjectTask(
              //   projectTitle: 'Management App Design',
              //   projectType: 'Design',
              //   noOfComments: 2,
              //   isPending: widget.isPending,
              // ),
              // const DottedDashedLine(
              //   height: 0,
              //   width: double.maxFinite,
              //   axis: Axis.horizontal,
              //   dashColor: kFontColor2,
              // ),
              // CardProjectTask(
              //   projectTitle: 'Web Dev',
              //   projectType: 'Web Development',
              //   noOfComments: 2,
              //   isPending: widget.isPending,
              // ),
              // const DottedDashedLine(
              //   height: 0,
              //   width: double.maxFinite,
              //   axis: Axis.horizontal,
              //   dashColor: kFontColor2,
              // ),
              // CardProjectTask(
              //   projectTitle: 'Web Design',
              //   projectType: 'Design',
              //   noOfComments: 2,
              //   isPending: widget.isPending,
              // ),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SingleProjectScreen()));
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
