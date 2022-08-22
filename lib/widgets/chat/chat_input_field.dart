import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: const BoxDecoration(
        color: kSecondaryColor,
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  border: Border.all(width: 1, color: const Color(0xFF503F23)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        style: kBodyStyle6,
                        decoration: InputDecoration(
                          hintText: "Type message here ...",
                          hintStyle: kBodyStyle6,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.attach_file, color: kFontColor4),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.send, color: kFontColor4),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
