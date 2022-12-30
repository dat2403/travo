import 'package:flutter/material.dart';
import 'package:travo/representation/screens/home_screen.dart';
import 'package:travo/representation/screens/main_app.dart';
import 'package:travo/representation/screens/intro_screen.dart';
import 'package:travo/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};