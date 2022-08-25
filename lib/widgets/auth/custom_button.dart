import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.buttonText,
    required this.fillColor,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final String buttonText;
  final Color fillColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: fillColor,
        //splashColor: Colors.greenAccent,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: fillColor == kSecondaryColor
                ? BorderSide(width: 3.w, color: kPrimaryColor)
                : BorderSide.none),
        child: SizedBox(
          height: 70.h,
          width: double.infinity,
          child: Center(
            child: isLoading
                ? spinKit(color: Colors.black)
                : Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                        color: fillColor == kPrimaryColor
                            ? kSecondaryColor
                            : kWhiteFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
          ),
        ),
      ),
    );
  }
}
