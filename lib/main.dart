import 'package:flutter/material.dart';
import 'package:manager_image/manger_image/cache_image_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

SharedPreferences? preferences;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cache Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CacheImagePage(),
    );
  }
}

