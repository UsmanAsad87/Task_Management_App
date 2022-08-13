import 'package:flutter/material.dart';
import 'package:task_management/Auth/login.dart';
import 'package:task_management/Auth/signup.dart';
import 'package:task_management/Home/home_screen.dart';
import 'package:task_management/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
