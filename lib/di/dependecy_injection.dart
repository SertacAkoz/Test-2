import 'package:get_it/get_it.dart';
import 'package:test_2/audio_page/audio_stlye.dart';
import 'package:test_2/audio_page/audio_view_model.dart';
import 'package:test_2/chat_page/chat_style.dart';
import 'package:test_2/chat_page/chat_view_model.dart';


final getIt = GetIt.instance;

class DependecyInjection{

  DependecyInjection(){
    provideStyles();
    provideViewModels();
  }

  void provideStyles(){
    getIt.registerSingleton<AudioStyle>(AudioStyle());
    getIt.registerSingleton<ChatStyle>(ChatStyle());
  }

  void provideViewModels(){
    getIt.registerSingleton<AudioViewModel>(AudioViewModel());
    getIt.registerSingleton<ChatViewModel>(ChatViewModel());
  }

}