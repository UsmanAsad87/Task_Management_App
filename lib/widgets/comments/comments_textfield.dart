import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';

class CommentsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final int maxLines;
  const CommentsTextField({
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
      style: kBodyStyle1,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: kFontColor4 //Colors.black.withOpacity(0.5),
                ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kWhiteColor, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kWhiteColor, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
