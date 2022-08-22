import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/utils/constants.dart';

class NotificationTile extends StatelessWidget {
  final String imagePath;
  final Color imageBgColor;
  final DateTime time;
  final Function() onPress;
  const NotificationTile({
    Key? key,
    required this.imagePath,
    required this.imageBgColor,
    required this.time,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      color: kSecondaryColor2,
      child: Row(
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
              child: Image.asset(
                imagePath,
                color: kFontColor1,
              ),
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
                  child: Row(
                    children: [
                      Text(
                        'Project Completed. ',
                        style: GoogleFonts.poppins(
                            color: kFontColor4,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Tap to view',
                          style: GoogleFonts.poppins(
                              color: kWhiteFontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat.jm().format(time),
                  style: GoogleFonts.poppins(
                      color: kFontColor4.withOpacity(0.62),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
