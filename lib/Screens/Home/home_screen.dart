import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/Home/all_projects.dart';
import 'package:task_management/Screens/Home/completed_projects.dart';
import 'package:task_management/Screens/Home/pending_projects.dart';
import 'package:task_management/Screens/chat/chat_screen.dart';
import 'package:task_management/Screens/history/history.dart';
import 'package:task_management/Screens/notification/notification.dart';
import 'package:task_management/Screens/settings/setting_screen.dart';
import 'package:task_management/Screens/single_task/create_task_screen.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/user_provider.dart';
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
  List<String> tabNames = [
    'All',
    'Pending',
    'Completed',
  ];
  late TabController _tabController;
  late ScrollController _horizontalScrollController;

  int currentIndex = 0;
  int index = 0;

  @override
  void initState() {
    addData();
    _horizontalScrollController = ScrollController();
    _tabController = TabController(length: tabNames.length, vsync: this);
    super.initState();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
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
        padding: EdgeInsets.only(right: 40.w),
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
        return const AllProjects();
      case 1:
        return const PendingProjects();
      case 2:
        return const CompletedProjects();
    }
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
    switch (index) {
      case 0:
        //Navigator.pushNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushNamed(context, ChatScreen.routeName).then((value) {
          if (mounted) {
            setState(() {
              this.index = 0;
            });
          }
        });

        break;
      case 2:
        Navigator.pushNamed(context, HistoryScreen.routeName).then((value) {
          if (mounted) {
            setState(() {
              this.index = 0;
            });
          }
        });
        break;
      case 3:
        Navigator.pushNamed(context, SettingScreen.routeName).then((value) {
          if (mounted) {
            setState(() {
              this.index = 0;
            });
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateTaskScreen.routeName);
          },
          backgroundColor: kWhiteColor,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Hi ${user.name}',
                        style: GoogleFonts.poppins(
                            color: kWhiteFontColor,
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
                  subtitle: Text(
                    'Good Afternoon',
                    style: kBodyStyle11,
                  ),
                  leading: user.profilePic.isEmpty
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(networkImageUrl),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(user.profilePic),
                        ),
                  trailing: SizedBox(
                    width: 70.w,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0.h),
                          child: InkWell(
                              onTap: () {},
                              child: Icon(Icons.search,
                                  size: 25.h, color: kPrimaryColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0.h),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NotificationScreen.routeName);
                              },
                              child: Stack(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 25.h,
                                    color: kPrimaryColor,
                                  ),
                                  Positioned(
                                      right: 3.w,
                                      top: 0.h,
                                      child: Container(
                                        height: 7.h,
                                        width: 7.w,
                                        decoration: BoxDecoration(
                                          color: kWhiteFontColor,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    //Your Projects Title
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Your Projects', style: kHeadingStyle2),
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
