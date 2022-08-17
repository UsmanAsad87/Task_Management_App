import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/homeScreen/active_project_tile.dart';
import 'package:task_management/widgets/homeScreen/project_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingProjects extends StatefulWidget {
  const PendingProjects({Key? key}) : super(key: key);

  @override
  State<PendingProjects> createState() => _PendingProjectsState();
}

class _PendingProjectsState extends State<PendingProjects> {
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
                        progressPercent: 0.5,
                      ),
                      ProjectCard(
                        cardColor: Color(0xFF488DE5),
                        weekRemaining: 1,
                        projectTitle: 'Management App Design',
                        noOfComments: 3,
                        progressPercent: 0.6,
                      ),
                      ProjectCard(
                        cardColor: Color(0xFF4F283D),
                        weekRemaining: 3,
                        projectTitle: 'Management App Design',
                        noOfComments: 5,
                        progressPercent: 0.2,
                      ),
                      ProjectCard(
                        cardColor: kPrimaryColor,
                        weekRemaining: 2,
                        projectTitle: 'Management App Design',
                        noOfComments: 2,
                        progressPercent: 0.5,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Active Projects',
                    style: kHeadingStyle2,
                  ),
                ),

                Column(
                  children: const [
                    ActiveProjectTile(
                      projectTitle: 'Graphic Design',
                      progressStatus: 'Inprogress',
                      imagePath: 'assets/icons/graphicDesign.png',
                      statusCount: 4,
                      imageBgColor: Color(0xFF1D4064),
                    ),
                    ActiveProjectTile(
                      projectTitle: 'Web Development',
                      progressStatus: 'Completed',
                      imagePath: 'assets/icons/web.png',
                      statusCount: 4,
                      imageBgColor: Color(0xFF75BDF9),
                    ),
                    ActiveProjectTile(
                      projectTitle: 'App Development',
                      progressStatus: 'Inprogress',
                      imagePath: 'assets/icons/app.png',
                      statusCount: 4,
                      imageBgColor: Color(0xFF412A3C),
                    ),
                    ActiveProjectTile(
                      projectTitle: 'App Development',
                      progressStatus: 'Inprogress',
                      imagePath: 'assets/icons/app.png',
                      statusCount: 4,
                      imageBgColor: Color(0xFF412A3C),
                    ),
                    ActiveProjectTile(
                      projectTitle: 'App Development',
                      progressStatus: 'Inprogress',
                      imagePath: 'assets/icons/app.png',
                      statusCount: 4,
                      imageBgColor: Color(0xFF412A3C),
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
