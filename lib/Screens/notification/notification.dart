import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/notificaton/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notification-screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //today
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  color: kTextFieldColor,
                  child: Text(
                    'Today',
                    style: kHeadingStyle4,
                  )),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  NotificationTile(
                      imagePath: 'assets/icons/web.png',
                      imageBgColor: kPrimaryColor,
                      time: DateTime.now(),
                      onPress: () {}),
                  NotificationTile(
                      imagePath: 'assets/icons/web.png',
                      imageBgColor: kPrimaryColor,
                      time: DateTime.now(),
                      onPress: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              //yesterday
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  color: kTextFieldColor,
                  child: Text(
                    'Yesterday',
                    style: kHeadingStyle4,
                  )),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  NotificationTile(
                      imagePath: 'assets/icons/web.png',
                      imageBgColor: kPrimaryColor,
                      time: DateTime.now(),
                      onPress: () {}),
                  NotificationTile(
                      imagePath: 'assets/icons/web.png',
                      imageBgColor: kPrimaryColor,
                      time: DateTime.now(),
                      onPress: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
