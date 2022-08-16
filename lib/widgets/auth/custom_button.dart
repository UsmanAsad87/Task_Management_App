import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.buttonText, required this.fillColor,
  });
  final Function()? onPressed;
  final String buttonText;
  final Color fillColor;

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
            side: fillColor==Colors.white?BorderSide(width: 2.w, color: Color(0xFF004064)):BorderSide.none),
        child: SizedBox(
          height: 70.h,
          width: double.maxFinite,
          child: Center(
            child: Text(buttonText,style: GoogleFonts.poppins(
                color: fillColor==Colors.white?const Color(0xff171C1F):const Color(0xffFFFFFF),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),),
          ),
        ),
      ),
    );
  }
}