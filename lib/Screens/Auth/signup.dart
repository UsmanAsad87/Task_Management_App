import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/auth/custom_button.dart';
import 'package:task_management/widgets/auth/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  var passObscure = true;
  var phoneObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _userNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              //LOGO
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'LO',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: kBlueColor,
                            fontSize: 36.sp)),
                    TextSpan(
                        text: 'GO',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 36.sp)),
                  ]),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create an account',
                  style: GoogleFonts.poppins(
                      color: kFontColor1,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter details in the given fields.',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff45575B),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                controller: _emailController,
                icon: Icons.person_outline,
                hintText: 'Username',
                onChanged: (val) {},
                obscure: false,
                onFieldSubmitted: (_) {},
                inputType: TextInputType.text,
              ),
              CustomTextField(
                controller: _passController,
                icon: Icons.lock_outline,
                hintText: 'Password',
                onChanged: (val) {},
                obscure: passObscure,
                leadingIcon: passObscure == false
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            passObscure = !passObscure;
                          });
                        },
                        child: const Icon(CupertinoIcons.eye,
                            color: Color(0xFF8C8C8C)))
                    : InkWell(
                        onTap: () {
                          setState(() {
                            passObscure = !passObscure;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Color(0xFF8C8C8C),
                        )),
                onFieldSubmitted: (_) {},
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: _emailController,
                icon: Icons.email_outlined,
                hintText: 'Email',
                onChanged: (val) {},
                obscure: false,
                onFieldSubmitted: (_) {},
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: _phoneController,
                icon: Icons.phone,
                hintText: 'Phone',
                onChanged: (val) {},
                obscure: phoneObscure,
                leadingIcon: phoneObscure == false
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            phoneObscure = !phoneObscure;
                          });
                        },
                        child: const Icon(CupertinoIcons.eye,
                            color: Color(0xFF8C8C8C)))
                    : InkWell(
                        onTap: () {
                          setState(() {
                            phoneObscure = !phoneObscure;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Color(0xFF8C8C8C),
                        )),
                onFieldSubmitted: (_) {},
                inputType: TextInputType.phone,
              ),
              SizedBox(height: size.height * 0.025),

              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                buttonText: 'Create',
                fillColor: const Color(0xff004064),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account? ',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff171C1F),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: 'Login',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff015EED),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          )),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}