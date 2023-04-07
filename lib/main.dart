import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/home_page.dart';

void main() {
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Color(0xFFC1121F)
      )
    ),
  ));
}

