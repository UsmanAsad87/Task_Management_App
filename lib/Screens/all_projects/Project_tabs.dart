import 'package:flutter/material.dart';
import 'package:task_management/Screens/all_projects/all_project_screen_2.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({Key? key}) : super(key: key);

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab>
    with SingleTickerProviderStateMixin {
  List<String> tabNames = [
    'Graphic Design',
    'App Development',
    'Web Development',
    'Graphic Design',
  ];
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
              : kInactiveTabColor,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        height: 38.h,
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
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
        return const AllProjectsScreen2();
      case 1:
        return const AllProjectsScreen2();
      case 2:
        return const AllProjectsScreen2(); //
      case 3:
        return const AllProjectsScreen2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          title: Text(
            'All Projects',
            style: kHeadingStyle3,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                  color: kPrimaryColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
             SizedBox(height: 10.h,),
            buildTabRow(context),
             SizedBox(height: 10.h,),
            handleTabPages(context, currentIndex),
          ]),
        ),
      ),
    );
  }
}
