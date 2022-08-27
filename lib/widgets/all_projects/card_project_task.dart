import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/single_task/edit_task_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../provider/task_provider.dart';

class CardProjectTask extends StatefulWidget {
  final TaskModel task;

  const CardProjectTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<CardProjectTask> createState() => _CardProjectTaskState();
}

class _CardProjectTaskState extends State<CardProjectTask> {
  int comments = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.task.comments?.length != null) {
      comments = widget.task.comments!.length;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: InkWell(
        onTap: () {
          Provider.of<TaskProvider>(context, listen: false).setSubTask =
              widget.task;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SingleTaskScreen(
                isProjectTask: true,
              ),
            ),
          );
        },
        child: Container(
          height: 75.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.task.categoryValue, style: kBodyStyle1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(widget.task.title, style: kBodyStyle2)),
                    widget.task.isPending
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditTaskScreen(
                                            isProjectTask: true,
                                          )));
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
                        '$comments comments',
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
                          color: widget.task.isPending
                              ? const Color(0xFF1D95E9)
                              : const Color(0xFF499B0D),
                        ),
                        child: Center(
                          child: Text(
                            widget.task.isPending ? 'Pending' : 'Completed',
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
