import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/homeScreen/quick_task_tile.dart';
import 'package:task_management/widgets/homeScreen/project_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedProjects extends StatefulWidget {
  const CompletedProjects({Key? key}) : super(key: key);

  @override
  State<CompletedProjects> createState() => _CompletedProjectsState();
}

class _CompletedProjectsState extends State<CompletedProjects> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Column(
              children: [
                //projects Card
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ProjectCard(
                        cardColor: kPrimaryColor,
                        weekRemaining: 2,
                        projectTitle: 'Management App Design',
                        noOfComments: 2,
                        isCompleted: false,
                      ),
                      ProjectCard(
                        cardColor: Color(0xFF488DE5),
                        weekRemaining: 1,
                        projectTitle: 'Management App Design',
                        noOfComments: 3,
                        isCompleted: true,
                      ),
                      ProjectCard(
                        cardColor: Color(0xFF4F283D),
                        weekRemaining: 3,
                        projectTitle: 'Management App Design',
                        noOfComments: 5,
                        isCompleted: false,
                      ),
                      ProjectCard(
                        cardColor: kPrimaryColor,
                        weekRemaining: 2,
                        projectTitle: 'Management App Design',
                        noOfComments: 2,
                        isCompleted: true,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Quick Tasks',
                    style: kHeadingStyle2,
                  ),
                ),

                Column(
                  children: const [
                    QuickTaskTile(
                      taskTitle: 'Front End Development',
                      taskStatus: 'Inprogress',
                      imagePath: 'assets/icons/graphicDesign.png',
                      imageBgColor: kPrimaryColor,
                    ),
                    QuickTaskTile(
                      taskTitle: 'BackEnd Development',
                      taskStatus: 'Completed',
                      imagePath: 'assets/icons/web.png',
                      imageBgColor: kPrimaryColor,
                    ),
                    QuickTaskTile(
                      taskTitle: 'Testing',
                      taskStatus: 'Inprogress',
                      imagePath: 'assets/icons/app.png',
                      imageBgColor: kPrimaryColor,
                    ),
                    QuickTaskTile(
                      taskTitle: 'Front End Development',
                      taskStatus: 'Completed',
                      imagePath: 'assets/icons/graphicDesign.png',
                      imageBgColor: kPrimaryColor,
                    ),
                    QuickTaskTile(
                      taskTitle: 'Testing',
                      taskStatus: 'Inprogress',
                      imagePath: 'assets/icons/app.png',
                      imageBgColor: kPrimaryColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
