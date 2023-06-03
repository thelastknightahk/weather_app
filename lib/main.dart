import 'package:flutter/material.dart';
import 'package:wealther_app/injection/injector.dart';
import 'package:wealther_app/presentation/features/home_screen/home_screen.dart';

Future<void> main() async {
  await initDependenciesInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageScreen());
  }
}
