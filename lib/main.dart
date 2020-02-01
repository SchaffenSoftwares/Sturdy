import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sturdy/login_page/login_page.dart';
import 'package:sturdy/onboarding.dart';



void main() => runApp(new MaterialApp(

  theme:
  ThemeData(primaryColor: Colors.blue, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),));


class SplashScreen extends StatefulWidget
{
  _SplashScreenState createState() => new  _SplashScreenState();
}

class  _SplashScreenState extends State<SplashScreen> {


  void completed()
  {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingScreen() ),);
  }


  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  Widget build(BuildContext context) {


    return new Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF17ead9),
                  Color(0xFF17ead9),
                  Color(0xFF6078ea),
                  Color(0xFF6078ea),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 1.0, left: 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(

                    flex: 2,

                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 80),
                              child: Image.asset('assets/Logo.png',
                                height: 400,
                                width: 400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(padding: EdgeInsets.only(top: 20.0),),
                        Text("CONNECTING STUDENTS",
                            style: TextStyle(color: Color(0xFF17ead9), fontFamily: 'Poppins-Bold', fontSize: 20)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 13.0),
                          child: Text("POWERED BY SCHAFFENS",
                              style: TextStyle(color: Color(0xFF5B16D0), fontFamily: 'Poppins-Bold')),),
                      ],
                    ),
                  )
                ],
              ),
            )

        ),
      ),
    );
  }
}

