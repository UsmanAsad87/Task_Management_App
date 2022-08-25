import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/Screens/Auth/login.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/auth_methods.dart';
import 'package:task_management/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/utils/loader.dart';
import 'package:task_management/utils/select_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/utils/toast.dart';

import '../../widgets/commons/custom_create_button.dart';

class ChangeProfileScreen extends StatefulWidget {
  static const routeName = '/change_profile';

  const ChangeProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  Uint8List? _image;
  bool _isLoading = false;
  bool _isLoading2 = false;
  //UserModel? user;

  @override
  void initState() {
    //getUserData();
    super.initState();
  }

  // getUserData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   user = await AuthMethods().getUserDetails();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kSecondaryColor,
        elevation: 0,
      ),
      body: /* _isLoading
          ? spinKit()
          : */
          Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 84, backgroundImage: MemoryImage(_image!))
                  : user.profilePic.isEmpty
                      ? const CircleAvatar(
                          radius: 84,
                          backgroundImage: NetworkImage(networkImageUrl))
                      : CircleAvatar(
                          radius: 84,
                          backgroundImage: NetworkImage(
                            user.profilePic,
                          )),
              SizedBox(
                height: 20.h,
              ),
              _isLoading2
                  ? spinKit()
                  : SizedBox(
                      height: 20.h,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCreateButton(
                      onPressed: selectImage,
                      buttonText: 'Select Image',
                      fillColor: kSecondaryColor),
                  CustomCreateButton(
                      onPressed: () async {
                        if (_image != null) {
                          setState(() {
                            _isLoading2 = true;
                          });
                          String res = await AuthMethods().updateProfilePic(
                              file: _image!, context: context);
                          if (res == "success") {
                            setState(() {
                              _isLoading2 = false;
                            });
                            showToast('Profile Image Updated');
                          } else {
                            showFlagMsg(
                                context: context,
                                msg: res,
                                textColor: Colors.red);
                          }
                          setState(() {
                            _isLoading2 = false;
                          });
                        } else {
                          showFlagMsg(
                              context: context,
                              msg: 'Select an image',
                              textColor: kPrimaryColor);
                        }
                      },
                      buttonText: 'Update',
                      fillColor: kPrimaryColor)
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
