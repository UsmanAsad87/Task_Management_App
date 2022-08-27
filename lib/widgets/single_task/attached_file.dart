import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/utils/loader.dart';

class AttachedFile extends StatelessWidget {
  final String filename;
  const AttachedFile({
    Key? key,
    required this.filename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Stack(
            children: [
              const ImageIcon(
                AssetImage(
                  'assets/file_icon.png',
                ),
                size: 35,
                color: Color(0xFFF1F1F1),
              ),
              Positioned(
                left: 5.w,
                top: 7.h,
                child: Icon(
                  size: 20.h,
                  Icons.attach_file,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: Text(filename, style: kBodyStyle3),
          )
        ],
      ),
    );
  }
}

class AttachedFileButton extends StatelessWidget {
  final String filename;
  final Function() onPress;
  const AttachedFileButton({
    Key? key,
    required this.filename,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPress,
            child: Stack(
              children: [
                const ImageIcon(
                  AssetImage(
                    'assets/file_icon.png',
                  ),
                  size: 35,
                  color: Color(0xFFF1F1F1),
                ),
                Positioned(
                  left: 5.w,
                  top: 7.h,
                  child: Icon(
                    size: 20.h,
                    Icons.attach_file,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: Text(filename, style: kBodyStyle3),
          )
        ],
      ),
    );
  }
}
