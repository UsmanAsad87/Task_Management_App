import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/forget_password.dart';
import 'package:task_management/Screens/Auth/signup.dart';
import 'package:task_management/Screens/Home/home_screen.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/utils/validator.dart';
import 'package:task_management/widgets/auth/custom_button.dart';
import 'package:task_management/widgets/auth/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  var obscure = true;
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              //LOGO
              Center(
                child: Image.asset(
                  'assets/background_image_splash.png',
                  height: 90.h,
                  width: 90.w,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.poppins(
                        color: kWhiteFontColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: Image.asset('assets/handImage.png')),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login to continue using',
                  style: GoogleFonts.poppins(
                      color: kFontColor4,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              Form(
                key: loginInKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      icon: Icons.email_outlined,
                      validatorFn: emailValidator,
                      hintText: 'Enter your Email',
                      onChanged: (val) {},
                      obscure: false,
                      onFieldSubmitted: (_) {},
                      inputType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _passController,
                      icon: Icons.lock_outline,
                      hintText: 'Password',
                      validatorFn: passValidator,
                      onChanged: (val) {},
                      obscure: obscure,
                      leadingIcon: obscure == false
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                              child: const Icon(CupertinoIcons.eye,
                                  color: Color(0xFF8C8C8C)))
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                              child: const Icon(
                                CupertinoIcons.eye_slash,
                                color: Color(0xFF8C8C8C),
                              )),
                      onFieldSubmitted: (_) {},
                      inputType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, ForgetPassword.routeName);
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.poppins(
                          color: kFontColor4,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(height: size.height * 0.03),

              CustomButton(
                isLoading: _isLoading,
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passController.text.isEmpty) {
                    showFlagMsg(
                        context: context,
                        msg: 'Enter all Fields',
                        textColor: Colors.red);
                    return null;
                  }
                  final form = loginInKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    setState(() {
                      _isLoading = true;
                    });
                    String res = await AuthMethods().loginUser(
                        email: _emailController.text,
                        password: _passController.text);
                    if (res == "success") {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
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
                        msg: 'Required fields are missing',
                        textColor: Colors.red);
                  }
                },
                buttonText: 'Login',
                fillColor: kPrimaryColor,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                buttonText: 'Create an account',
                fillColor: kSecondaryColor,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                            color: kWhiteFontColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
