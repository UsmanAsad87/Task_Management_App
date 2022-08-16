import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSmallButton extends StatelessWidget {
  CustomSmallButton({
    required this.onPressed,
    required this.buttonText,
    required this.fillColor,
    required this.textColor,
  });
  final Function()? onPressed;
  final String buttonText;
  final Color fillColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        elevation: 2,
        fillColor: fillColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),),
        child: SizedBox(
          height: 33.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 24.w),
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
