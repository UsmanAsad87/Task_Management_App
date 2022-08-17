import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MilestoneItem extends StatelessWidget {
  final String title;
  final int hr;
  final int min;
  const MilestoneItem({
    Key? key,
    required this.title,
    required this.hr,
    required this.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
        color: kPrimaryColor,
        height: 12.h,
        width: 12.w,
      ),
      beforeLineStyle: LineStyle(
        color: Color(0xFFE1D5D5),
        thickness: 2.w,
      ),
      endChild: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          children: [
            Text(
              title,
              style: kBodyStyle6,
            ),
            Spacer(),
            Container(
              color: Color(0xFFF4F5F8),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.w),
                child: Text(
                  'Est. ${hr}hrs.${min}m',
                  style: kBodyStyle7,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
