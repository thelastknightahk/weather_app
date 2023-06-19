import 'package:flutter/material.dart';
import 'package:wealther_app/global/routes/app_routers.dart';
import 'package:wealther_app/global/services/notification_service.dart';
import 'package:wealther_app/injection/injector.dart'; 
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependenciesInjection();
  NotificationService.requestPermission();
  NotificationService.getUserToken();
  NotificationService.subscribeToTopic();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouters.router,
    );
  }
}
