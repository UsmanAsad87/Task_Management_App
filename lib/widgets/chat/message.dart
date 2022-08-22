import 'package:flutter/material.dart';
import 'package:task_management/model/ChatMessage.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/chat/image_message.dart';
import 'package:task_management/widgets/chat/text_message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.image:
          return ImageMessage(message: message);
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12.r,
              backgroundImage: const NetworkImage(
                  'https://i.pinimg.com/originals/06/81/39/068139bff0b22024e775bfcbb42ed3b4.jpg'),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message),
          if (message.isSender) ...[
            SizedBox(width: kDefaultPadding / 2),
            CircleAvatar(
              radius: 12.r,
              backgroundImage: const NetworkImage(
                  'https://i.pinimg.com/originals/06/81/39/068139bff0b22024e775bfcbb42ed3b4.jpg'),
            ),
          ],
        ],
      ),
    );
  }
}
