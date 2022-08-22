import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertBox extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function() onPressed;
  const AlertBox({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 2.5,
          child: const ImageIcon(
            AssetImage(
              'assets/icons/confirm_icon.png',
            ),
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          text,
          style: kHeadingStyle2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30.h,
        ),
        RawMaterialButton(
          elevation: 2,
          fillColor: kPrimaryColor,
          //splashColor: Colors.greenAccent,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SizedBox(
            height: 50.h,
            width: 200.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                        color: kSecondaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
