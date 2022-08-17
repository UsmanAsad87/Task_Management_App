import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';

class CustomCreateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final int maxLines;
  const CustomCreateTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    required this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: kBodyStyle2,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF8C8C8C)
              .withOpacity(0.7), //Colors.black.withOpacity(0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
