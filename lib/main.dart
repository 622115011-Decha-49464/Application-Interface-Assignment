// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:interface_assignment/Page/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram interface by Decha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF1b2735)),
      home: HomePage(),
    );
  }
}
