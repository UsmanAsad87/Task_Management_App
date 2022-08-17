import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveProjectTile extends StatelessWidget {
  final String projectTitle;
  final String progressStatus;
  final String imagePath;
  final int statusCount;
  final Color imageBgColor;
  const ActiveProjectTile({
    Key? key,
    required this.projectTitle,
    required this.progressStatus,
    required this.imagePath,
    required this.statusCount,
    required this.imageBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(3.w, 20.h),
            blurRadius: 50.r,
            color: const Color(0xFF9F9F9F).withOpacity(0.18),
          ),
        ],
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
                padding: EdgeInsets.all(8.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectTitle,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          padding: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: progressStatus == 'Inprogress'
                                ? Colors.blue
                                : Colors.green,
                            borderRadius: BorderRadius.circular(25.0.r),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '$progressStatus ($statusCount)',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
