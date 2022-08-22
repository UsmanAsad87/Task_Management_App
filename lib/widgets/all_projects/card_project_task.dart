import 'package:flutter/material.dart';
import 'package:task_management/Screens/single_task/edit_task_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProjectTask extends StatelessWidget {
  final String projectTitle;
  final String projectType;
  final int noOfComments;
  final bool isPending;

  const CardProjectTask({
    Key? key,
    required this.projectTitle,
    required this.projectType,
    required this.noOfComments,
    required this.isPending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SingleTaskScreen(
                        title: projectTitle,
                        isPending: isPending,
                      )));
        },
        child: Container(
          height: 75.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(projectType, style: kBodyStyle1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(projectTitle, style: kBodyStyle2)),
                    isPending
                        ? InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, EditTaskScreen.routeName);
                            },
                            child: const Icon(
                              Icons.edit_outlined,
                              color: kPrimaryColor,
                            ))
                        : const SizedBox(),
                  ],
                ),
              ),

              //comments and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 23.h,
                            width: 35.w,
                          ),
                          Container(
                            height: 23.h,
                            width: 23.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(25.0.r),
                                border: Border.all(
                                    width: 3.r, color: kSecondaryColor)),
                          ),
                          Positioned(
                              left: 12,
                              top: 0,
                              child: Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFB800),
                                    borderRadius: BorderRadius.circular(25.0.r),
                                    border: Border.all(
                                        width: 3.r, color: kSecondaryColor)),
                              ))
                        ],
                      ),
                      Text(
                        '$noOfComments comments',
                        style: kBodyStyle11,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: const Color(0xFF393939),
                        ),
                        child: Center(
                          child: Text(
                            'Task',
                            style: kBodyStyle10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 15.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: isPending
                              ? const Color(0xFF1D95E9)
                              : const Color(0xFF499B0D),
                        ),
                        child: Center(
                          child: Text(
                            isPending ? 'Pending' : 'Completed',
                            style: kBodyStyle10,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
