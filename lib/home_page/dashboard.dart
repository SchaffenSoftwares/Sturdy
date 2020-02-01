import 'package:flutter/material.dart';
import 'griddashboard.dart';
import '../home_page/navigation_bloc.dart';
void main() => runApp(MaterialApp(home: CoursePage()));

class CoursePage extends StatefulWidget with NavigationStates{
  @override
  CoursePageState createState() => new CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 145, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/image_01.png'),
                      radius: 70.0,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "USERNAME",
                      style: TextStyle(
                              color: Color(0xFF00838F),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "DISCUSSION",
                      style: TextStyle(
                              color: Color(0xFF00838F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}