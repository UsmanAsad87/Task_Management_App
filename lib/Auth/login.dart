import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/widgets/commons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  var obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              //LOGO
              Center(
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'LO',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: kBlueColor,
                            fontSize: 36)),
                    TextSpan(
                        text: 'GO',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 36)),
                  ]),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.poppins(
                        color: kFontColor1,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/handImage.png')),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login to continue using',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff45575B),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                controller: _emailController,
                icon: Icons.email_outlined,
                hintText: 'Enter your Email',
                onChanged: (val) {},
                obscure: false,
                onFieldSubmitted: (_) {},
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: _passController,
                icon: Icons.lock_outline,
                hintText: 'Password',
                onChanged: (val) {},
                obscure: obscure,
                leadingIcon: obscure == false
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: const Icon(CupertinoIcons.eye,
                            color: Color(0xFF8C8C8C)))
                    : InkWell(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Color(0xFF8C8C8C),
                        )),
                onFieldSubmitted: (_) {},
                inputType: TextInputType.emailAddress,
              ),
              InkWell(
                onTap: () {},
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.poppins(
                          color: Color(0xff45575B),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(height: size.height * 0.03),

              CustomButton(
                onPressed: () {},
                buttonText: 'Login',
                fillColor: const Color(0xff004064),
              ),
              CustomButton(
                onPressed: () {},
                buttonText: 'Create an account',
                fillColor: Colors.white,
              ),
              InkWell(
                onTap: () {},
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.poppins(
                          color:const Color(0xff171C1F),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


