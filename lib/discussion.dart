import 'package:sturdy/discussion/pages/chats.dart';
import 'package:flutter/material.dart';

void main() => runApp(Discussion());

class Discussion extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Chats(),
    );
  }
}