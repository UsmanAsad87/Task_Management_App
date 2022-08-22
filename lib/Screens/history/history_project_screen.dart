import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/history/card_history_project.dart';

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
          children: const [
            CardHistoryProject(
              title: 'Front End Development',
              status: 'Completed',
              imagePath: 'assets/icons/graphicDesign.png',
              imageBgColor: kPrimaryColor,
              subTasks: 2,
            ),
            CardHistoryProject(
              title: 'BackEnd Development',
              status: 'Completed',
              imagePath: 'assets/icons/web.png',
              imageBgColor: kPrimaryColor,
              subTasks: 2,
            ),
            CardHistoryProject(
              title: 'Testing',
              status: 'Completed',
              imagePath: 'assets/icons/app.png',
              imageBgColor: kPrimaryColor,
              subTasks: 2,
            ),
            CardHistoryProject(
              title: 'Front End Development',
              status: 'Completed',
              imagePath: 'assets/icons/graphicDesign.png',
              imageBgColor: kPrimaryColor,
              subTasks: 2,
            ),
            CardHistoryProject(
              title: 'Testing',
              status: 'Completed',
              imagePath: 'assets/icons/app.png',
              imageBgColor: kPrimaryColor,
              subTasks: 2,
            )
          ],
        ),
      ),
    );
  }
}
