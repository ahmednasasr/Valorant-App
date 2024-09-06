import 'package:flutter/material.dart';
import 'package:routeexam/core/theme.dart';
import 'package:routeexam/screens/agient_detail.dart';
import 'package:routeexam/screens/home_screen.dart';
import 'package:routeexam/spalsh/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename:(_)=>HomeScreen(),
        SplashScreen.routename:(_)=>SplashScreen(),
        AgientDetail.routename:(_)=>AgientDetail()
      },
      title: 'Flutter Demo',
      theme: themeapp.themeData,
        home: SplashScreen(),
    );
  }
}

