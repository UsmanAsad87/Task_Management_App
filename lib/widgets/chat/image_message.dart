import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';

class ImageMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5, // 45% of total width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/msg_image.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, right: 5),
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
