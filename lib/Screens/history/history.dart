import 'package:flutter/material.dart';
import 'package:task_management/Screens/history/history_Task_screen.dart';
import 'package:task_management/Screens/history/history_project_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/history-screen';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabNames = ['Projects', 'Quick Tasks'];
  late TabController _tabController;
  late ScrollController _horizontalScrollController;

  int currentIndex = 0;

  @override
  void initState() {
    _horizontalScrollController = ScrollController();
    _tabController = TabController(length: tabNames.length, vsync: this);
    super.initState();
  }

  buildTabRow(context) {
    return Container(
      margin: EdgeInsets.only(top: 22.0.h, left: 16.0.w, right: 16.0.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _horizontalScrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i in tabNames)
              buildTabButton(
                  context: context,
                  title: i,
                  index: tabNames.indexOf(i),
                  function: () {}),
          ],
        ),
      ),
    );
  }

  buildTabButton(
      {required BuildContext context,
      required String title,
      required Function function,
      required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = tabNames.indexOf(title);
        });
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: 0.0.h, left: 0.0.w, right: 16.0.w, top: 0.0.h),
        decoration: BoxDecoration(
          color: tabNames.indexOf(title) == currentIndex
              ? kPrimaryColor
              : kTextFieldColor,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        height: 34.h,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 25.w),
          child: Center(
            child: Text(title,
                style: tabNames.indexOf(title) == currentIndex
                    ? kTabTextActiveStyle
                    : kTabTextInActiveStyle),
          ),
        ),
      ),
    );
  }

  handleTabPages(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const HistoryProjectScreen();
      case 1:
        return const HistoryTaskScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          leading: const BackButton(color: kWhiteColor),
          backgroundColor: kSecondaryColor,
          elevation: 0,
          title: Text(
            'History',
            style: kHeadingStyle3,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                  color: kWhiteColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                buildTabRow(context),
                SizedBox(
                  height: 10.h,
                ),
                handleTabPages(context, currentIndex),
              ]),
        ),
      ),
    );
  }
}
