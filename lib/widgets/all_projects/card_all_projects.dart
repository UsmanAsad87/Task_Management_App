import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardAllProject extends StatelessWidget {
  final String projectTitle;
  final String projectType;
  final int noOfComments;
  final double progressPercent;

  const CardAllProject({
    Key? key,
    required this.projectTitle,
    required this.projectType,
    required this.noOfComments,
    required this.progressPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: Container(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectType,
                      style: kBodyStyle1
                    ),
                    Text(
                      projectTitle,
                      style: kBodyStyle2
                    ),
                    //commnents
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
                                  border: Border.all(color: Colors.white)),
                            ),
                            Positioned(
                                left: 8,
                                top: 0,
                                child: Container(
                                  height: 15.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFB800),
                                      borderRadius: BorderRadius.circular(25.0.r),
                                      border: Border.all(color: Colors.white)),
                                ))
                          ],
                        ),
                        Text(
                          '$noOfComments comments',
                          style: kBodyStyle3,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: 15.r,
              lineWidth: 4.0.w,
              animation: true,
              percent: progressPercent,
              center: Text(
                "${(progressPercent*100).toInt()}%",
                style:
                kCircularPercentageStyle,
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor:kProgressColor,
            ),
          ],
        ),
      ),
    );
  }
}
