import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refresh/homepage.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open the box before running the app
  await Hive.openBox('myBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
    );
  }
}

