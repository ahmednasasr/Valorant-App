import 'package:flutter/material.dart';
import 'package:routeexam/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routename="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/Splash Screen Dark.png",fit: BoxFit.cover,),
    );
  }
}
