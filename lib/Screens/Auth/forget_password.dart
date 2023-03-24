import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/change_password.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/utils/validator.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget_pass';
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  var obscure = true;
  GlobalKey<FormState> forgetPassKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forget Password?',
              style: kHeadingStyle2,
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              margin: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kTextFieldColor,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: kFontColor4.withOpacity(0.54),
                    size: 38,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    child: Center(
                        child: Text(
                      'Enter your email, you will receive a email to change your password',
                      style: kBodyStyle4a,
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Form(
                    key: forgetPassKey,
                    child: SizedBox(
                      width: 250.w,
                      child: TextFormField(
                        validator: emailValidator,
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'BeyondITsolution@gmail.com',
                          hintStyle: kBodyStyle4a,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: kBodyStyle4,
                        onFieldSubmitted: (val) {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: const Divider(
                      thickness: 0.5,
                      color: kPrimaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            RawMaterialButton(
              elevation: 2,
              fillColor: kPrimaryColor,
              //splashColor: Colors.greenAccent,
              onPressed: () async {
                if (_emailController.text.isEmpty) {
                  showFlagMsg(
                      context: context,
                      msg: 'Enter the email',
                      textColor: Colors.red);
                  return null;
                }
                final form = forgetPassKey.currentState;
                if (form!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  String res = await AuthMethods()
                      .resetPassword(email: _emailController.text);
                  if (res == "success") {
                    setState(() {
                      _isLoading = false;
                    });
                    showToast('Reset password email is sent.');
                    await Future.delayed(Duration(milliseconds: 2000), () {})
                        .then((value) => Navigator.pushNamed(
                            context, LoginScreen.routeName));
                  } else {
                    showFlagMsg(
                        context: context, msg: res, textColor: Colors.red);
                  }
                  setState(() {
                    _isLoading = false;
                  });

                } else {
                  showFlagMsg(
                      context: context,
                      msg: 'Enter the proper email',
                      textColor: Colors.red);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SizedBox(
                height: 50.h,
                width: 150.w,
                child: Center(
                  child: Text(
                    'Send',
                    style: GoogleFonts.poppins(
                        color: kSecondaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
