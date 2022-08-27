import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/projects/project.dart';
import 'package:task_management/provider/project_provider.dart';
import 'package:task_management/utils/constants.dart';

class CardHistoryProject extends StatelessWidget {
  final String title;
  final String status;
  final String imagePath;
  final Color imageBgColor;
  final int subTasks;
  final String projectId;
  const CardHistoryProject({
    Key? key,
    required this.title,
    required this.status,
    required this.imagePath,
    required this.imageBgColor,
    required this.subTasks,
    required this.projectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
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
          height: 85.h,
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
            color: const Color(0xFF252525),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: imageBgColor,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.h),
                      child: Image.asset(imagePath),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.0.h),
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                                color: kWhiteFontColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.w,
                              padding: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                color: status == 'Inprogress'
                                    ? Colors.blue
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(25.0.r),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '$status ($subTasks tasks ) ',
                              style: GoogleFonts.poppins(
                                  color: kFontColor4,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: kWhiteFontColor,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
