import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/Screens/Auth/signup.dart';
import 'package:task_management/Screens/Home/home_screen.dart';
import 'package:task_management/Screens/all_projects/Project_tabs.dart';
import 'package:task_management/Screens/comments/comments_screen.dart';
import 'package:task_management/Screens/create_project/create_project_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen_2.dart';
import 'package:task_management/router.dart';

import 'Screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 781),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task Management App',
          onGenerateRoute: (settings) => generateRoute(settings),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child: const SingleTaskScreen2(),
    );
  }
}
