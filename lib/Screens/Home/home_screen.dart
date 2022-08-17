import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/Screens/Home/all_projects.dart';
import 'package:task_management/Screens/Home/completed_projects.dart';
import 'package:task_management/Screens/Home/pending_projects.dart';
import 'package:task_management/Screens/Home/recent_projects.dart';
import 'package:task_management/Screens/Home/weekly_projects.dart';
import 'package:task_management/Screens/all_projects/all_project_screen.dart';
import 'package:task_management/Screens/chat/chat_screen.dart';
import 'package:task_management/Screens/create_project/create_project_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen_2.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/widgets/homeScreen/tab_bar_material_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabNames = ['Pending', 'Recent', 'Completed', 'All', 'Weekly'];
  late TabController _tabController;
  late ScrollController _horizontalScrollController;

  int currentIndex = 0;
  int index = 0;

  @override
  void initState() {
    _horizontalScrollController = ScrollController();
    _tabController = TabController(length: tabNames.length, vsync: this);
    super.initState();
  }

  buildTabRow(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0.h, left: 20.0.w, right: 20.0.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _horizontalScrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      child: Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: Text(title,
            style: tabNames.indexOf(title) == currentIndex
                ? kTextButtonActiveStyle
                : kTextButtonInActiveStyle),
      ),
    );
  }

  handleTabPages(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const PendingProjects();
      case 1:
        return const RecentProjects();
      case 2:
        return const CompletedProjects(); //
      case 3:
        return const AllProjects();
      case 4:
        return const WeeklyProjects();
    }
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushNamed(context, ChatScreen.routeName);
        break;
      case 2:
        Navigator.pushNamed(context, AllProjectsScreen.routeName);
        break;
      case 3:
        //Navigator.pushNamed(context, SingleTaskScreen2.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateProjectScreen.routeName);
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Hi Beyond',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                          height: 16.h,
                          width: 16.w,
                          child: Image.asset('assets/handImage.png')),
                    ],
                  ),
                  subtitle: const Text('Good Afternoon'),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/06/81/39/068139bff0b22024e775bfcbb42ed3b4.jpg'),
                  ),
                  trailing: SizedBox(
                    width: 70.w,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0.h),
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.search,
                                  color: Color(0xFF004064))),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0.h),
                          child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: Color(0xFF004064),
                                  ),
                                  Positioned(
                                      right: 4.w,
                                      top: 0.h,
                                      child: Container(
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFB800),
                                          borderRadius:
                                              BorderRadius.circular(25.0.r),
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: kDefaultPadding,
                    left: kDefaultPadding,
                    right: kDefaultPadding),
                child: Column(
                  children: [
                    //Your Projects Title
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Your Projects',
                        style: GoogleFonts.poppins(
                            color: kFontColor1,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              buildTabRow(context),
              handleTabPages(context, currentIndex),
            ]),
          ),
        ),
      ),
    );
  }
}
