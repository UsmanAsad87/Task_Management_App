import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/utils/validator.dart';
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
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  var passObscure = true;

  bool _isLoading = false;

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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create an account',
                  style: GoogleFonts.poppins(
                      color: kWhiteFontColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter details in the given fields.',
                  style: GoogleFonts.poppins(
                    color: kFontColor4,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                key: signUpKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _userNameController,
                      validatorFn: uNameValidator,
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
                      validatorFn: passValidator,
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
                      validatorFn: emailValidator,
                      hintText: 'Email',
                      onChanged: (val) {},
                      obscure: false,
                      onFieldSubmitted: (_) {},
                      inputType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _phoneController,
                      icon: Icons.phone,
                      obscure: false,
                      validatorFn: phoneValidator,
                      hintText: 'Phone',
                      onChanged: (val) {},
                      onFieldSubmitted: (_) {},
                      inputType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),

              CustomButton(
                isLoading: _isLoading,
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passController.text.isEmpty ||
                      _userNameController.text.isEmpty ||
                      _phoneController.text.isEmpty) {
                    showFlagMsg(
                        context: context,
                        msg: 'Enter all Fields',
                        textColor: Colors.red);
                    return null;
                  }
                  final form = signUpKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    setState(() {
                      _isLoading = true;
                    });
                    String res = await AuthMethods().signUpUser(
                      email: _emailController.text,
                      password: _passController.text,
                      username: _userNameController.text,
                      phoneNumber: _phoneController.text,
                    );
                    setState(() {
                      _isLoading = false;
                    });
                    if (res != 'success') {
                      showFlagMsg(
                          context: context, msg: res, textColor: Colors.red);
                    } else {
                      showToast('Account Created Successfully');
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }
                  } else {
                    showFlagMsg(
                        context: context,
                        msg: 'Required fields are missing',
                        textColor: Colors.red);
                  }
                },
                buttonText: 'Create',
                fillColor: kPrimaryColor,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Already have an account? ',
                            style: GoogleFonts.poppins(
                                color: kWhiteFontColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'Login',
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            )),
                      ]),
                    ),
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
