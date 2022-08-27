import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/model/TaskModel.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/widgets/homeScreen/quick_task_tile.dart';
import 'package:task_management/widgets/homeScreen/project_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingProjects extends StatefulWidget {
  const PendingProjects({Key? key}) : super(key: key);

  @override
  State<PendingProjects> createState() => _PendingProjectsState();
}

class _PendingProjectsState extends State<PendingProjects> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            //projects Card
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 180.h,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('projects')
                      .where('isPending', isEqualTo: true)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                          padding: EdgeInsets.all(30.h), child: spinKit());
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0.w, top: 30.h),
                            child: Text(
                              'There are no pending Projects',
                              style: kTextButtonInActiveStyle,
                            ),
                          ));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        ProjectModel project = ProjectModel.fromJson(
                            snapshot.data!.docs[index].data());
                        return ProjectCard(
                          cardColor: cardColor[index % 4],
                          weekRemaining: 2,
                          projectTitle: project.title,
                          noOfComments: 2, //project.comments!.length,
                          isCompleted: !project.isPending,
                          projectId: project.projectId,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.topLeft,
              child: Text(
                'Quick Tasks',
                style: kHeadingStyle2,
              ),
            ),

            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('tasks')
                  .where('isPending', isEqualTo: true)
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
                          'There are no pending Quick Tasks',
                          style: kTextButtonInActiveStyle,
                        ),
                      ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    TaskModel task =
                        TaskModel.fromJson(snapshot.data!.docs[index].data());
                    return QuickTaskTile(
                      taskId: task.taskId,
                      taskTitle: task.title,
                      taskStatus: task.isPending ? 'Inprogress' : 'Completed',
                      imagePath: 'assets/icons/graphicDesign.png',
                      imageBgColor: kPrimaryColor,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
