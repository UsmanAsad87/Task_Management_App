import 'package:flutter/material.dart';
import 'package:task_management/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldBgColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.7,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: kScaffoldCircleColor1, borderRadius: BorderRadius.circular(200)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.3,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: kScaffoldCircleColor2, borderRadius: BorderRadius.circular(200)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale:0.9,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: kScaffoldCircleColor3, borderRadius: BorderRadius.circular(200)),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text('LOGO',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w900),)
          ),
        ],
      ),
    );
  }
}
