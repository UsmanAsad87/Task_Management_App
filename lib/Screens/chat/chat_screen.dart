import 'package:flutter/material.dart';
import 'package:task_management/model/ChatMessage.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/chat/chat_input_field.dart';
import 'package:task_management/widgets/chat/message.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: const BackButton(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text(
          'Chat',
          style: kHeadingStyle3,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) =>
                    Message(message: demeChatMessages[index]),
              ),
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}
