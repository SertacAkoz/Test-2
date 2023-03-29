import 'package:flutter/material.dart';
import 'package:test_2/chat_detail_page/components/message.dart';
import 'package:test_2/models/ChatMessage.dart';
import 'package:test_2/utils/constants.dart';

import 'chat_input_fields.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) => Message(message: demeChatMessages[index]),
          ),
        )),
        const ChatInputField()
      ],
    );
  }
}
