import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/Auth/pass_change_succ.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/utils/toast.dart';
import 'package:task_management/utils/validator.dart';
import 'package:task_management/widgets/auth/custom_button.dart';
import 'package:task_management/widgets/auth/custom_text_field.dart';

class UpdateUsername extends StatefulWidget {
  static const routeName = '/change_username';
  const UpdateUsername({Key? key}) : super(key: key);

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
  final TextEditingController _usernameController = TextEditingController();

  GlobalKey<FormState> changeUsenameKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(
          'Update Username',
          style: kHeadingStyle3,
        ),
        centerTitle: true,
      ),
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Change Username',
              //   style: kHeadingStyle2,
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Form(
                key: changeUsenameKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validatorFn: uNameValidator,
                      controller: _usernameController,
                      hintText: user.name,
                      onChanged: (val) {},
                      obscure: false,
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
                  if (_usernameController.text.isEmpty) {
                    showFlagMsg(
                        context: context,
                        msg: 'Enter the username',
                        textColor: Colors.red);
                    return null;
                  }
                  final form = changeUsenameKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    setState(() {
                      _isLoading = true;
                    });
                    String res = await AuthMethods().updateUsername(
                        username: _usernameController.text, context: context);
                    if (res == "success") {
                      setState(() {
                        _isLoading = false;
                      });
                      showToast('Username Updated Successfully');
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
                buttonText: 'Update Username',
                fillColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
