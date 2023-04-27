import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/NaviBar.dart';
import 'package:project/login.dart';
import 'package:project/topicpage.dart';
import 'package:project/theme.dart';
import 'package:project/firebase_options.dart';
import 'package:project/homepage.dart';
import 'package:project/post_page.dart';
import 'package:project/feed.dart';

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
