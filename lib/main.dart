/// Main coder: Chi
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Fulbright_Vietnam_Forum/APIBackend/route/route_config.dart';
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:Fulbright_Vietnam_Forum/login.dart';
import 'package:Fulbright_Vietnam_Forum/topicpage.dart';
import 'package:provider/provider.dart';
import 'services/firebase_auth_methods.dart';
import 'theme.dart';
import 'firebase_options.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDvUzg34RXaPxDayn5vsnxew2fmSPZENRk",
          projectId: "fulbrightforum-8d6f9",
          messagingSenderId: "30010715802",
          appId: "1:30010715802:web:4a1551ba2f3b961ee3b923"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null,
          ),
        ],
        child: MaterialApp.router(
            title: 'Fulbright Forum',
            debugShowCheckedModeBanner: false,
            theme: MyTheme.defaultTheme,
            routerConfig: MyAppRouter().router));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    // if user is valid return home
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const LoginPage();
  }
}
