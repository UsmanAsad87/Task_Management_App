import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_management/utils/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final Color cardColor;
  final int weekRemaining;
  final String projectTitle;
  final int noOfComments;
  final double progressPercent;

  const ProjectCard({
    Key? key,
    required this.cardColor,
    required this.weekRemaining,
    required this.projectTitle,
    required this.noOfComments,
    required this.progressPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      width: 165.w,
      margin:  EdgeInsets.only(top: 10.h,  right: 10.w),
      padding:  EdgeInsets.only(top: 18.h, bottom: 12.h, left: 13.w, right: 13.w),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border.all(
          color: kWhiteColor,
        ),
        borderRadius: BorderRadius.circular(25.0.r),
      ),
      child: Column(
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
            child: Text(
              projectTitle,
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
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
          //progress bar
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress',
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  padding: EdgeInsets.all(0.h),
                  width: 100.0.w,
                  lineHeight: 5.0.h,
                  percent: progressPercent,
                  progressColor: kProgressColor,
                  barRadius: Radius.circular(20.r),
                ),
              ),
              Text(
                '${(progressPercent * 100).toInt()}%',
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
