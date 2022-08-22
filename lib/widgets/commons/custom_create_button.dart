import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';

class CustomCreateButton extends StatelessWidget {
  CustomCreateButton({
    required this.onPressed,
    required this.buttonText,
    required this.fillColor,
    this.isDottedBorder = false,
  });
  final Function()? onPressed;
  final String buttonText;
  final Color fillColor;
  final bool isDottedBorder;

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
                ? BorderSide(width: 2.w, color: kPrimaryColor)
                : BorderSide.none),
        child: SizedBox(
          height: 53.h,
          width: (MediaQuery.of(context).size.width / 2) - 30,
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                  color: fillColor == kPrimaryColor
                      ? kFontColor1
                      : kWhiteFontColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
