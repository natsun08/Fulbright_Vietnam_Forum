import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/API%20backend/route/route_config.dart';
import 'package:project/NaviBar.dart';
import 'package:project/login.dart';
import 'package:project/topicpage.dart';
import 'theme.dart';
import 'firebase_options.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fulbright Forum',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.defaultTheme,
      routeInformationParser: MyAppRouter().router.routeInformationParser,
      routerDelegate: MyAppRouter().router.routerDelegate,
    );
  }
}
