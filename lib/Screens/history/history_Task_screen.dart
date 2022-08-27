import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/all_projects/card_project_task.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:task_management/widgets/homeScreen/quick_task_tile.dart';

class HistoryTaskScreen extends StatefulWidget {
  static const routeName = '/history-project-screen';
  const HistoryTaskScreen({Key? key}) : super(key: key);

  @override
  State<HistoryTaskScreen> createState() => _HistoryTaskScreenState();
}

class _HistoryTaskScreenState extends State<HistoryTaskScreen> {
  late DateTime _selectedValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('tasks')
                  .where('isPending', isEqualTo: false)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                      padding: EdgeInsets.all(30.h), child: spinKit());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Text(
                          'There are no completed Quick Tasks',
                          style: kTextButtonInActiveStyle,
                        ),
                      ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    TaskModel task =
                        TaskModel.fromJson(snapshot.data!.docs[index].data());
                    return Column(
                      children: [
                        CardProjectTask(task: task),
                        if (index != snapshot.data!.docs.length - 1)
                          const DottedDashedLine(
                            height: 0,
                            width: double.maxFinite,
                            axis: Axis.horizontal,
                            dashColor: kFontColor2,
                          ),
                      ],
                    );
                    QuickTaskTile(
                      taskId: task.taskId,
                      taskTitle: task.title,
                      taskStatus: task.isPending ? 'Inprogress' : 'Completed',
                      imagePath: imgUrl[index % 3],
                      imageBgColor: kPrimaryColor,
                    );
                  },
                );
              },
            ),
            // CardProjectTask(
            //   projectTitle: 'Web Development',
            //   projectType: 'Design',
            //   noOfComments: 2,
            //   isPending: false,
            // ),
            // DottedDashedLine(
            //   height: 0,
            //   width: double.maxFinite,
            //   axis: Axis.horizontal,
            //   dashColor: kFontColor2,
            // ),
            // CardProjectTask(
            //   projectTitle: 'Management App Design',
            //   projectType: 'Design',
            //   noOfComments: 2,
            //   isPending: false,
            // ),
            // DottedDashedLine(
            //   height: 0,
            //   width: double.maxFinite,
            //   axis: Axis.horizontal,
            //   dashColor: kFontColor2,
            // ),
            // CardProjectTask(
            //   projectTitle: 'Web Development',
            //   projectType: 'Design',
            //   noOfComments: 5,
            //   isPending: false,
            // ),
            // DottedDashedLine(
            //   height: 0,
            //   width: double.maxFinite,
            //   axis: Axis.horizontal,
            //   dashColor: kFontColor2,
            // ),
            // CardProjectTask(
            //   projectTitle: 'Management App Design',
            //   projectType: 'Design',
            //   noOfComments: 2,
            //   isPending: false,
            // ),
            // DottedDashedLine(
            //   height: 0,
            //   width: double.maxFinite,
            //   axis: Axis.horizontal,
            //   dashColor: kFontColor2,
            // ),
            // CardProjectTask(
            //   projectTitle: 'Web Development',
            //   projectType: 'Design',
            //   noOfComments: 24,
            //   isPending: false,
            // ),
            // DottedDashedLine(
            //   height: 0,
            //   width: double.maxFinite,
            //   axis: Axis.horizontal,
            //   dashColor: kFontColor2,
            // ),
            // CardProjectTask(
            //   projectTitle: 'Management App Design',
            //   projectType: 'Design',
            //   noOfComments: 2,
            //   isPending: false,
            // ),
          ],
        ),
      ),
    );
  }
}
