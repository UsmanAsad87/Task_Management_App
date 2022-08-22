import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/pass_change_succ.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
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
  var passObscure = true;

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
              CustomTextField(
                controller: _passController,
                hintText: 'Enter Password',
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
                controller: _confirmController,
                hintText: 'Confirm Password',
                onChanged: (val) {},
                obscure: true,
                leadingIcon: Transform.scale(
                  scale: 0.5,
                  child: ImageIcon(
                    const AssetImage(
                      'assets/icons/confirm_icon.png',
                    ),
                    color: Color(0xFF544D38),
                  ),
                ),
                onFieldSubmitted: (_) {},
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, PassChangeSuccessful.routeName);
                },
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
