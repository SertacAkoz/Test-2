import 'package:flutter/material.dart';
import 'package:test_2/audio_page/audio_stlye.dart';
import 'package:test_2/audio_page/audio_view.dart';
import 'package:test_2/audio_page/audio_view_model.dart';
import 'package:test_2/di/dependecy_injection.dart';
import 'package:test_2/home_page/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependecyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioView(
        style: getIt.get<AudioStyle>(),
        viewModel: getIt.get<AudioViewModel>(),
      ),
    );
  }
}
