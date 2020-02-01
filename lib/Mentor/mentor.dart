import 'package:sturdy/Mentor/chat_details.dart';
import 'package:flutter/material.dart';
import 'package:sturdy/home_page/navigation_bloc.dart';

void main() => runApp(Mentor());

class Mentor extends StatelessWidget with NavigationStates {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChatDetails(),
    );
  }
}

