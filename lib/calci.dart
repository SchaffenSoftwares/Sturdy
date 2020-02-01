import 'package:flutter/material.dart';
import 'package:sturdy/home_page/navigation_bloc.dart';
import 'calculator/scientificCalculator.dart';

void main() => runApp(Calci());

class Calci extends StatelessWidget with NavigationStates{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScientificCalculator(),
    );
  }
}