import 'package:flutter/material.dart';
import 'package:task_management/Screens/create_project/create_sub_task_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedButton extends StatelessWidget {
  final double width;
  final String text;
  final double height;
  final Function() onPress;
  const DottedButton({
    Key? key,
    required this.width,
    required this.text,
    required this.height,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: EdgeInsets.all(1),
      borderType: BorderType.RRect,
      dashPattern: [6, 6],
      radius: Radius.circular(10),
      color: kPrimaryColor,
      strokeWidth: 2,
      child: RawMaterialButton(
        elevation: 2,
        fillColor: kSecondaryColor,
        //splashColor: Colors.greenAccent,
        onPressed: onPress,
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: kWhiteFontColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
