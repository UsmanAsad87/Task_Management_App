import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/all_projects/card_project_task.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';

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
          children: const [
            CardProjectTask(
              projectTitle: 'Web Development',
              projectType: 'Design',
              noOfComments: 2,
              isPending: false,
            ),
            DottedDashedLine(
              height: 0,
              width: double.maxFinite,
              axis: Axis.horizontal,
              dashColor: kFontColor2,
            ),
            CardProjectTask(
              projectTitle: 'Management App Design',
              projectType: 'Design',
              noOfComments: 2,
              isPending: false,
            ),
            DottedDashedLine(
              height: 0,
              width: double.maxFinite,
              axis: Axis.horizontal,
              dashColor: kFontColor2,
            ),
            CardProjectTask(
              projectTitle: 'Web Development',
              projectType: 'Design',
              noOfComments: 5,
              isPending: false,
            ),
            DottedDashedLine(
              height: 0,
              width: double.maxFinite,
              axis: Axis.horizontal,
              dashColor: kFontColor2,
            ),
            CardProjectTask(
              projectTitle: 'Management App Design',
              projectType: 'Design',
              noOfComments: 2,
              isPending: false,
            ),
            DottedDashedLine(
              height: 0,
              width: double.maxFinite,
              axis: Axis.horizontal,
              dashColor: kFontColor2,
            ),
            CardProjectTask(
              projectTitle: 'Web Development',
              projectType: 'Design',
              noOfComments: 24,
              isPending: false,
            ),
            DottedDashedLine(
              height: 0,
              width: double.maxFinite,
              axis: Axis.horizontal,
              dashColor: kFontColor2,
            ),
            CardProjectTask(
              projectTitle: 'Management App Design',
              projectType: 'Design',
              noOfComments: 2,
              isPending: false,
            ),
          ],
        ),
      ),
    );
  }
}
