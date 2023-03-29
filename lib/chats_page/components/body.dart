import 'package:flutter/material.dart';
import 'package:test_2/models/Chat.dart';
import 'package:test_2/utils/constants.dart';
import 'package:test_2/utils/utils.dart';
import 'package:test_2/widgets/filled_outline_button.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: ((context, index) => ChatCard(
                  chat: chatsData[index],
                  // press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesScreen())),
                  press: () {
                    Utils.safeNavigate('/chatDetail', context, null);
                  },
                )),
          ),
        )
      ],
    );
  }
}
