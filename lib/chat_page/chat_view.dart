// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:test_2/chat_page/chat_style.dart';
import 'package:test_2/chat_page/chat_view_model.dart';

class ChatView extends StatelessWidget {
  ChatStyle style;
  ChatViewModel viewModel;
  ChatView({
    Key? key,
    required this.style,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
