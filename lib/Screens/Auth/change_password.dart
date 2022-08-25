import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/pass_change_succ.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/utils/validator.dart';
import 'package:task_management/widgets/auth/custom_button.dart';
import 'package:task_management/widgets/auth/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/change_password';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  GlobalKey<FormState> changePassKey = GlobalKey<FormState>();

  var passObscure = true;
  var newPassObscure = true;

  bool _isLoading = false;

  @override
  void dispose() {
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Change Password',
                style: kHeadingStyle2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                key: changePassKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validatorFn: passValidator,
                      controller: _passController,
                      hintText: 'Enter Old Password',
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
                      inputType: TextInputType.text,
                    ),
                    CustomTextField(
                      validatorFn: passValidator,
                      controller: _confirmController,
                      hintText: 'Enter New Password',
                      onChanged: (val) {},
                      obscure: newPassObscure,
                      leadingIcon: newPassObscure == false
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  newPassObscure = !newPassObscure;
                                });
                              },
                              child: const Icon(CupertinoIcons.eye,
                                  color: Color(0xFF8C8C8C)))
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  newPassObscure = !newPassObscure;
                                });
                              },
                              child: const Icon(
                                CupertinoIcons.eye_slash,
                                color: Color(0xFF8C8C8C),
                              )),
                      // leadingIcon: Transform.scale(
                      //   scale: 0.5,
                      //   child: ImageIcon(
                      //     const AssetImage(
                      //       'assets/icons/confirm_icon.png',
                      //     ),
                      //     color: Color(0xFF544D38),
                      //   ),
                      // ),
                      onFieldSubmitted: (_) {},
                      inputType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onPressed: () async {
                  if (_confirmController.text.isEmpty ||
                      _passController.text.isEmpty) {
                    showFlagMsg(
                        context: context,
                        msg: 'Enter all Fields',
                        textColor: Colors.red);
                    return null;
                  }
                  final form = changePassKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    setState(() {
                      _isLoading = true;
                    });
                    String res = await AuthMethods().changePassword(
                        _passController.text, _confirmController.text);
                    if (res == 'success') {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pushNamed(
                          context, PassChangeSuccessful.routeName);
                    } else {
                      showFlagMsg(
                          context: context, msg: res, textColor: Colors.red);
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  } else {
                    // showFlagMsg(
                    //     context: context,
                    //     msg: 'Required fields are missing',
                    //     textColor: Colors.red);
                  }
                },
                //
                // },
                buttonText: 'Create Password',
                fillColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
