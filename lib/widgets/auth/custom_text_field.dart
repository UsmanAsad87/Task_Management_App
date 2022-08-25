import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final Function(String) onChanged;
  final bool obscure;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? leadingIcon;
  final String? Function(String?)? validatorFn;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    required this.hintText,
    required this.onChanged,
    required this.obscure,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
    this.validatorFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding:
          EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w, bottom: 10.h),
      height: 70.h,
      decoration: BoxDecoration(
        color: kTextFieldColor,
        borderRadius: BorderRadius.circular(10.r),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(10.w, 10.h),
        //     blurRadius: 50.r,
        //     color: const Color(0xFF9F9F9F).withOpacity(0.2),
        //   )
        // ],
      ),
      child: Row(
        children: [
          icon != null
              ? Container(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  child: Icon(
                    icon,
                    color: kFontColor4,
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: TextFormField(
              validator: validatorFn,
              obscureText: obscure,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                suffixIcon: leadingIcon ?? SizedBox(),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: kFontColor4, //Colors.black.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: kBodyStyle4,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
