/// Main coder: Chi
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:Fulbright_Vietnam_Forum/login.dart';
import 'package:Fulbright_Vietnam_Forum/topicpage.dart';
import 'package:Fulbright_Vietnam_Forum/theme.dart';
import 'package:Fulbright_Vietnam_Forum/firebase_options.dart';
import 'package:Fulbright_Vietnam_Forum/homepage.dart';
import 'package:Fulbright_Vietnam_Forum/post_page.dart';
import 'package:Fulbright_Vietnam_Forum/feed.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: "home",
        path: '/',
        builder: (context, state) {
          return HomePage();
        }),
    GoRoute(
        name: "login",
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        }),
    // Will change this next phase, this's only hard code for prototype purpose
    GoRoute(
        name: "Student Life",
        path: '/student-life',
        builder: (context, state) {
          return MyTopicPage();
        }),
    GoRoute(
        name: "Baking",
        path: '/baking',
        builder: (context, state) {
          return MyHomePage();
        }),
  ]);
}
