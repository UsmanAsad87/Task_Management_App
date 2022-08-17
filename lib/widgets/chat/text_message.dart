import 'package:flutter/material.dart';
import 'package:task_management/model/ChatMessage.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: message!.isSender ? Colors.white : Color(0xFFF3F3F3),
            borderRadius: message!.isSender
                ? BorderRadius.only(
                    bottomRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r))
                : BorderRadius.only(
                    bottomRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
            boxShadow: [
              BoxShadow(
                offset: Offset(5.w, 5.h),
                blurRadius: 50.r,
                color: message!.isSender
                    ? const Color(0xFF9F9F9F).withOpacity(0.2)
                    : const Color(0xFF9F9F9F).withOpacity(0.2),
              )
            ],
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              message!.text,
              style: kBodyStyle6,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: Text(
            '9:00 PM',
            style: kBodyStyle8,
          ),
        )
      ],
    );
  }
}
