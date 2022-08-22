import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/change_password.dart';
import 'package:task_management/Screens/Auth/forget_password.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/Screens/Auth/pass_change_succ.dart';
import 'package:task_management/Screens/Auth/signup.dart';
import 'package:task_management/Screens/Home/home_screen.dart';
import 'package:task_management/Screens/history/history_Task_screen.dart';
import 'package:task_management/Screens/projects/project.dart';
import 'package:task_management/Screens/projects/single_project_screen.dart';
import 'package:task_management/Screens/chat/chat_screen.dart';
import 'package:task_management/Screens/comments/comments_screen.dart';
import 'package:task_management/Screens/create_project/create_project_screen.dart';
import 'package:task_management/Screens/create_project/create_sub_task_screen.dart';
import 'package:task_management/Screens/create_project/edit_project_screen.dart';
import 'package:task_management/Screens/history/history.dart';
import 'package:task_management/Screens/notification/notification.dart';
import 'package:task_management/Screens/settings/setting_screen.dart';
import 'package:task_management/Screens/single_task/create_task_screen.dart';
import 'package:task_management/Screens/single_task/edit_task_screen.dart';
import 'package:task_management/Screens/single_task/single_task_screen.dart';
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
    case HistoryScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HistoryScreen(),
      );
    case HistoryTaskScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HistoryTaskScreen(),
      );

    case ChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      );
    case SettingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      );
    case CommentsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CommentsScreen(),
      );
    case CreateTaskScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateTaskScreen(),
      );
    case CreateSubTaskScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateSubTaskScreen(),
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
        builder: (context) => const SingleTaskScreen(
          title: 'Management App Design',
        ),
      );
    case EditTaskScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditTaskScreen(),
      );
    case ProjectScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProjectScreen(
          title: 'Web Development',
        ),
      );
    case SingleProjectScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SingleProjectScreen(
          title: 'Management App Design',
        ),
      );
    case EditProjectScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditProjectScreen(),
      );

    case ForgetPassword.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPassword(),
      );
    case ChangePassword.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChangePassword(),
      );
    case PassChangeSuccessful.routeName:
      return MaterialPageRoute(
        builder: (context) => const PassChangeSuccessful(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "This page doesn't exists"),
        ),
      );
  }
}
