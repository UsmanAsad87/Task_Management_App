import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class PassChangeSuccessful extends StatefulWidget {
  static const routeName = '/pass_change_successful';
  const PassChangeSuccessful({Key? key}) : super(key: key);

  @override
  State<PassChangeSuccessful> createState() => _PassChangeSuccessfulState();
}

class _PassChangeSuccessfulState extends State<PassChangeSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 2,
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
                  'You’ve successfully \n changed your password',
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
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
                            'Go to the App',
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
            ),
          ),
        ),
      ),
    );
  }
}
