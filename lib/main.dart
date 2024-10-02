import 'package:advfinalapp/views/HomePage.dart';
import 'package:advfinalapp/views/LoginScreen.dart';
import 'package:advfinalapp/views/SignUpScreen.dart';
import 'package:advfinalapp/views/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "splash_screen",
    routes: {
      '/': (context) => SignUpScreen(),
      'splash_screen': (context) => Splashscreen(),
      'login_screen': (context) => LoginScreen(),
      'home_screen': (context) => HomePage(),
    },
  ));
}
