import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/projects/project.dart';
import 'package:task_management/provider/project_provider.dart';
import 'package:task_management/utils/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final Color cardColor;
  final int weekRemaining;
  final String projectTitle;
  final int noOfComments;
  final bool isCompleted;
  final String projectId;

  const ProjectCard({
    Key? key,
    required this.cardColor,
    required this.weekRemaining,
    required this.projectTitle,
    required this.noOfComments,
    required this.isCompleted,
    required this.projectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ProjectProvider projectProvider = Provider.of(context, listen: false);
        await projectProvider.refreshSelectedProject(projectId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectScreen(),
          ),
        );
      },
      child: Container(
        height: 165.h,
        width: 165.w,
        margin: EdgeInsets.only(top: 10.h, right: 10.w),
        padding:
            EdgeInsets.only(top: 18.h, bottom: 12.h, left: 13.w, right: 13.w),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(25.0.r),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 18.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kWhiteColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      child: Center(
                        child: Text(
                          '$weekRemaining Week Remaining',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 35.h,
                      child: Text(
                        projectTitle,
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                //comments
                Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 15.h,
                          width: 25.w,
                        ),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(25.0.r),
                              border: Border.all(color: cardColor)),
                        ),
                        Positioned(
                            left: 8.w,
                            top: 0.h,
                            child: Container(
                              height: 15.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFB800),
                                  borderRadius: BorderRadius.circular(25.0.r),
                                  border: Border.all(color: cardColor)),
                            ))
                      ],
                    ),
                    Text(
                      '$noOfComments comments',
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 18.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: isCompleted
                        ? const Color(0xFF009B06)
                        : const Color(0xFF252525),
                  ),
                  child: Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Text(
                      isCompleted ? 'Completed' : 'Pending',
                      style: kBodyStyle12,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
