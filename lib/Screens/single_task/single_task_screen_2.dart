import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/single_task/attached_file.dart';
import 'package:task_management/widgets/single_task/custom_small_button.dart';
import 'package:task_management/widgets/single_task/mile_stone_item.dart';

class SingleTaskScreen2 extends StatefulWidget {
  static const routeName = '/single_task_screen_2';
  const SingleTaskScreen2({Key? key}) : super(key: key);
  @override
  _SingleTaskScreen2State createState() => _SingleTaskScreen2State();
}

class _SingleTaskScreen2State extends State<SingleTaskScreen2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1D4064),
      appBar: AppBar(backgroundColor: const Color(0xff1D4064), elevation: 0),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              width: 160.w,
              height: 160.h,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/background_image.png',
                      ))),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: (size.height * 0.17) - 30,
            child: Container(
              height: size.height - (size.height * 0.28),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r))),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      height: 5.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Management App Design',
                              style: kHeadingStyle3,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText: 'MileStone',
                              fillColor: Colors.blueAccent,
                              textColor: Colors.white),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus a neque varius Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus a neque varius ',
                        style: kTextButtonInActiveStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText: 'Design',
                              fillColor: const Color(0xFFD5FFCE),
                              textColor: const Color(0xFF8D8D8D)),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText: 'Mid',
                              fillColor: Colors.green,
                              textColor: Colors.white)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Due Date',
                          style: kBodyStyle4,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '15',
                          style: kBodyStyle4,
                        ),
                        Container(
                          height: 50.h,
                          width: 40.w,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 8.h),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Text(
                            'oct',
                            style: kBodyStyle5,
                          ),
                        ),
                        Text(
                          '22',
                          style: kBodyStyle4,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'MileStone',
                          style: kBodyStyle4,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        MilestoneItem(
                          title: 'Design Phase',
                          hr: 22,
                          min: 20,
                        ),
                        MilestoneItem(
                          title: 'Development',
                          hr: 29,
                          min: 54,
                        ),
                        MilestoneItem(
                          title: 'Testing',
                          hr: 32,
                          min: 2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Attachments',
                          style: kBodyStyle4,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          AttachedFile(
                            filename: '1.png',
                          ),
                          AttachedFile(
                            filename: 'doc.docs',
                          ),
                          AttachedFile(
                            filename: '1.png',
                          ),
                          AttachedFile(
                            filename: '6.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}