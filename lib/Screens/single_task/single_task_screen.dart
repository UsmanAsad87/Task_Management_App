import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Screens/comments/comments_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/single_task/attached_file.dart';
import 'package:task_management/widgets/single_task/custom_small_button.dart';

import '../../widgets/commons/custom_create_button.dart';
import 'edit_task_screen.dart';

class SingleTaskScreen extends StatefulWidget {
  final String title;
  final bool isPending;
  static const routeName = '/single_task_screen';
  const SingleTaskScreen({Key? key, required this.title, this.isPending = true})
      : super(key: key);

  @override
  _SingleTaskScreenState createState() => _SingleTaskScreenState();
}

class _SingleTaskScreenState extends State<SingleTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kFontColor1),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: (size.height * 0.25) - 30,
            child: Container(
              height: size.height - (size.height * 0.3),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(35.r)),
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
                        color: kWhiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: kHeadingStyle3,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText: 'Task',
                              fillColor: kTextFieldColor,
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
                              fillColor: kPrimaryColor,
                              textColor: const Color(0xFF1B1B1B)),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText: 'High',
                              fillColor: kTextFieldColor,
                              textColor: Colors.white),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomSmallButton(
                              onPressed: () {},
                              buttonText:
                                  widget.isPending ? 'Pending' : 'Completed',
                              fillColor: widget.isPending
                                  ? const Color(0xFF1D95E9)
                                  : const Color(0xFF499B0D),
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
                          style: kBodyStyle13,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '15',
                          style: kBodyStyle13,
                        ),
                        Container(
                          height: 50.h,
                          width: 40.w,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 8.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFF322B1F),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Text(
                            'oct',
                            style: kBodyStyle5,
                          ),
                        ),
                        Text(
                          '22',
                          style: kBodyStyle13,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Attachments',
                          style: kBodyStyle13,
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
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCreateButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, CommentsScreen.routeName);
                            },
                            buttonText: 'View Comments',
                            fillColor: kSecondaryColor),
                        widget.isPending
                            ? CustomCreateButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, EditTaskScreen.routeName);
                                },
                                buttonText: 'Edit',
                                fillColor: kPrimaryColor)
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 100,
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
