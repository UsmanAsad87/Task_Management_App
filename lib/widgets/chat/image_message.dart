import 'package:flutter/material.dart';
import 'package:task_management/model/ChatMessage.dart';
import 'package:task_management/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageMessage extends StatelessWidget {
  final ChatMessage message;

  const ImageMessage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5, // 45% of total width
      decoration: BoxDecoration(
        color: kTextFieldColor,
        borderRadius: message.isSender
            ? BorderRadius.only(
                bottomRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                topLeft: Radius.circular(10.r))
            : BorderRadius.only(
                bottomRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r)),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(5.w, 5.h),
        //     blurRadius: 50.r,
        //     color: message!.isSender
        //         ? const Color(0xFF9F9F9F).withOpacity(0.2)
        //         : const Color(0xFF9F9F9F).withOpacity(0.2),
        //   )
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.w),
            child: AspectRatio(
              aspectRatio: 1.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset('assets/msg_image.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w, bottom: 5.h),
            child: Text(
              '9:00 PM',
              style: kBodyStyle8,
            ),
          ),
        ],
      ),
    );
  }
}
