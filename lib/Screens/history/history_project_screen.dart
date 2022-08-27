import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management/model/ProjectModel.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/widgets/history/card_history_project.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryProjectScreen extends StatefulWidget {
  const HistoryProjectScreen({Key? key}) : super(key: key);

  @override
  State<HistoryProjectScreen> createState() => _HistoryProjectScreenState();
}

class _HistoryProjectScreenState extends State<HistoryProjectScreen> {
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
                  .collection('projects')
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
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w, top: 30.h),
                        child: Text(
                          'There are no completed Projects',
                          style: kTextButtonInActiveStyle,
                        ),
                      ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    ProjectModel project = ProjectModel.fromJson(
                        snapshot.data!.docs[index].data());
                    return CardHistoryProject(
                      projectId: project.projectId,
                      title: project.title,
                      status: 'Completed',
                      imagePath: imgUrl[index % 3],
                      imageBgColor: kPrimaryColor,
                      subTasks: project.tasks!.length,
                    );
                  },
                );
              },
            ),

            // CardHistoryProject(
            //   title: 'Front End Development',
            //   status: 'Completed',
            //   imagePath: 'assets/icons/graphicDesign.png',
            //   imageBgColor: kPrimaryColor,
            //   subTasks: 2,
            // ),
            // CardHistoryProject(
            //   title: 'BackEnd Development',
            //   status: 'Completed',
            //   imagePath: 'assets/icons/web.png',
            //   imageBgColor: kPrimaryColor,
            //   subTasks: 2,
            // ),
            // CardHistoryProject(
            //   title: 'Testing',
            //   status: 'Completed',
            //   imagePath: 'assets/icons/app.png',
            //   imageBgColor: kPrimaryColor,
            //   subTasks: 2,
            // ),
            // CardHistoryProject(
            //   title: 'Front End Development',
            //   status: 'Completed',
            //   imagePath: 'assets/icons/graphicDesign.png',
            //   imageBgColor: kPrimaryColor,
            //   subTasks: 2,
            // ),
            // CardHistoryProject(
            //   title: 'Testing',
            //   status: 'Completed',
            //   imagePath: 'assets/icons/app.png',
            //   imageBgColor: kPrimaryColor,
            //   subTasks: 2,
            // )
          ],
        ),
      ),
    );
  }
}
