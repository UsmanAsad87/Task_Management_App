import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/change_password.dart';
import 'package:task_management/Screens/settings/change_profile_screen.dart';
import 'package:task_management/Screens/settings/change_usrename.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchValue = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor2,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kSecondaryColor2,
        elevation: 0,
        title: Text(
          'Setting',
          style: kHeadingStyle3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Security',
                  style: kHeadingStyle4,
                ),
                Column(
                  children: [
                    Container(
                      height: 0.5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                      width: double.infinity,
                      color: kWhiteColor.withOpacity(0.38),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ChangePassword.routeName);
                      },
                      child: ListTile(
                          title: Text(
                            'Change Password',
                            style: kBodyStyle15,
                          ),
                          trailing: const Icon(
                            Icons.lock_outline,
                            color: kWhiteColor,
                          )),
                    ),
                    Container(
                      height: 0.5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
                      width: double.infinity,
                      color: kWhiteColor.withOpacity(0.09),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const UpdateUsername()));
                      },
                      child: ListTile(
                          title: Text(
                            'Change Username',
                            style: kBodyStyle15,
                          ),
                          trailing: const Icon(
                            Icons.person_outline,
                            color: kWhiteColor,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'General',
                  style: kHeadingStyle4,
                ),
                Column(
                  children: [
                    Container(
                      height: 0.5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                      width: double.infinity,
                      color: kWhiteColor.withOpacity(0.38),
                    ),
                    ListTile(
                      title: Text(
                        'Notifications',
                        style: kBodyStyle15,
                      ),
                      trailing: Transform.scale(
                        scale: 0.6,
                        child: SizedBox(
                          width: 30.w,
                          child: CupertinoSwitch(
                            activeColor: kTextFieldColor,
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
                      width: double.infinity,
                      color: kWhiteColor.withOpacity(0.09),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ChangeProfileScreen()));
                      },
                      child: ListTile(
                          title: Text(
                            'Change Profile Picture',
                            style: kBodyStyle15,
                          ),
                          trailing: const Icon(
                            CupertinoIcons.person_circle,
                            color: kWhiteColor,
                          )),
                    ),
                    Container(
                      height: 0.5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
                      width: double.infinity,
                      color: kWhiteColor.withOpacity(0.09),
                    ),
                    InkWell(
                      onTap: () {
                        AuthMethods().signOut();
                      },
                      child: ListTile(
                        title: Text(
                          'Logout',
                          style: kBodyStyle15,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
