// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, avoid_print


import 'package:mobx/mobx.dart';

part 'chat_view_model.g.dart';

class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  
}
