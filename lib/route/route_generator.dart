import 'package:flutter/cupertino.dart';
import 'package:test_2/audio_page/audio_stlye.dart';
import 'package:test_2/audio_page/audio_view.dart';
import 'package:test_2/audio_page/audio_view_model.dart';
import 'package:test_2/chat_detail_page/chat_detail_view.dart';

import 'package:test_2/chats_page/chats_view.dart';
import 'package:test_2/di/dependecy_injection.dart';
import 'package:test_2/home_page/home_style.dart';
import 'package:test_2/home_page/home_view.dart';

class RouteGenerator {
  static Route<dynamic>? _routeOlustur(
    Widget gidilecekWidget,
    RouteSettings settings,
  ) {
    return CupertinoPageRoute(
        settings: settings, builder: (context) => gidilecekWidget);
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(HomeView(style: getIt.get<HomeStyle>(),), settings);
      case '/audioPage':
        return _routeOlustur(AudioView(style: getIt.get<AudioStyle>(), viewModel: getIt.get<AudioViewModel>()), settings);
      case '/chatPage':
        return _routeOlustur(const ChatsView(), settings);
      case '/chatDetail':
        return _routeOlustur(const ChatDetailView(), settings);
      default:
        return _routeOlustur(HomeView(style: getIt.get<HomeStyle>(),), settings);
    }
  }
}
