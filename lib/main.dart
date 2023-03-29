import 'package:flutter/material.dart';

import 'package:test_2/di/dependecy_injection.dart';
import 'package:test_2/route/route_generator.dart';

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
      onGenerateRoute: RouteGenerator.routeGenerator,
      debugShowCheckedModeBanner: false,
      title: 'Test 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
    );
  }
}
