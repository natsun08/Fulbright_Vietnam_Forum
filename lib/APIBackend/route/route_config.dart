/// Main coder: Chi
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:Fulbright_Vietnam_Forum/login.dart';
import 'package:Fulbright_Vietnam_Forum/topicpage.dart';
import 'package:Fulbright_Vietnam_Forum/theme.dart';
import 'package:Fulbright_Vietnam_Forum/firebase_options.dart';
import 'package:Fulbright_Vietnam_Forum/homepage.dart';
import 'package:Fulbright_Vietnam_Forum/post_page.dart';
import 'package:Fulbright_Vietnam_Forum/feed.dart';
import 'package:Fulbright_Vietnam_Forum/newpost.dart';
import 'package:Fulbright_Vietnam_Forum/services/firebase_auth_methods.dart';
import 'package:Fulbright_Vietnam_Forum/main.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: "home",
        path: '/',
        builder: (context, state) {
          return AuthWrapper();
        }),
    GoRoute(
        name: "login",
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        }),
    GoRoute(
        path: "/:category",
        builder: (context, state) {
          return MyTopicPage(category: state.params["category"]!);
        }),
    GoRoute(
        path: "/:category/:topic",
        builder: (context, state) {
          return MyHomePage(
              category: state.params["category"]!,
              topic: state.params["topic"]!);
        }),
    GoRoute(
        path: "/:category/:topic/new",
        builder: (context, state) {
          return NewPostPage();
        })
  ]);
}
