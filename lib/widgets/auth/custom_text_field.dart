import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Function(String) onChanged;
  final bool obscure;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? leadingIcon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.onChanged,
    required this.obscure,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding:
          EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w, bottom: 10.h),
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 10.h),
            blurRadius: 50.r,
            color: const Color(0xFF9F9F9F).withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              right: 10.w,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF8C8C8C),
            ),
          ),
          Expanded(
            child: TextFormField(
              obscureText: obscure,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                suffixIcon: leadingIcon ?? SizedBox(),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C), //Colors.black.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
