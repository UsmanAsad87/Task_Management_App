import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/Screens/Auth/signup.dart';
import 'package:task_management/Screens/Home/home_screen.dart';
import 'package:task_management/Screens/all_projects/Project_tabs.dart';
import 'package:task_management/Screens/all_projects/all_project_screen.dart';
import 'package:task_management/Screens/all_projects/all_project_screen_2.dart';
import 'package:task_management/Screens/chat/chat_screen.dart';
import 'package:task_management/Screens/comments/comments_screen.dart';
import 'package:task_management/Screens/create_project/create_project_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen_2.dart';
import 'package:task_management/Screens/splash/splash_screen.dart';
import 'package:task_management/widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case AllProjectsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllProjectsScreen(),
      );
    case AllProjectsScreen2.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllProjectsScreen2(),
      );
    case ProjectsTab.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProjectsTab(),
      );
    case ChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      );
    case CommentsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CommentsScreen(),
      );
    case CreateProjectScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateProjectScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case SingleTaskScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SingleTaskScreen(),
      );
    case SingleTaskScreen2.routeName:
      return MaterialPageRoute(
        builder: (context) => const SingleTaskScreen2(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "This page doesn't exists"),
        ),
      );
  }
}
