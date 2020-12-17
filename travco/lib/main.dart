import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travco/constants.dart';
import 'package:travco/view/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TravCo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
          // 1B44A6  //blue color
      ),
      home: HomeScreen(),
    );
  }
}