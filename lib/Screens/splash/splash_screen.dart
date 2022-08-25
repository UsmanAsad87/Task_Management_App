import 'package:flutter/material.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = IntTween(begin: 0, end: 1000).animate(animationController!);
    animationController!.forward();
    _navigateToLogin();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/background_image_splash.png',
                height: 267.h,
                width: 267.w,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 236.w,
                height: 5.h,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  color: kPrimaryColor,
                  value: (animation!.value) / 100.0,
                ),
              )
            ],
          ),
        ));
  }
}
