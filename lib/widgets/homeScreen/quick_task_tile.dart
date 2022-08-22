import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/utils/constants.dart';

class QuickTaskTile extends StatelessWidget {
  final String taskTitle;
  final String taskStatus;
  final String imagePath;
  final Color imageBgColor;
  const QuickTaskTile({
    Key? key,
    required this.taskTitle,
    required this.taskStatus,
    required this.imagePath,
    required this.imageBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SingleTaskScreen(title: taskTitle)));
        },
        child: Container(
          height: 85.h,
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
            color: const Color(0xFF252525),
            borderRadius: BorderRadius.circular(10.0.r),
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(3.w, 20.h),
            //     blurRadius: 50.r,
            //     color: const Color(0xFF9F9F9F).withOpacity(0.18),
            //   ),
            // ],
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
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.w, 10.h),
                          blurRadius: 50.r,
                          color: imageBgColor.withOpacity(0.2),
                        )
                      ],
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
                            taskTitle,
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
                                color: taskStatus == 'Inprogress'
                                    ? Colors.blue
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(25.0.r),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '$taskStatus ',
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
