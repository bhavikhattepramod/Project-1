import 'package:flutter/material.dart';
import 'package:project/Logout.dart';
import 'package:project/api.dart';
import 'package:project/constants.dart';
import 'package:project/login_page.dart';
import 'Download.dart';
import 'Food.dart';
import 'calendar.dart';
import 'geo.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Geo(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Geo(),
    // );
  }
}
