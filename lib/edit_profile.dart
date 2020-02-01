import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sturdy/home_page/dashboard.dart';
import 'package:sturdy/home_page/navigation_drawer.dart';
import 'package:sturdy/login_page/FormCard.dart';
import 'package:sturdy/login_page//SocialIcons.dart';
import 'package:sturdy/login_page/FormCardS.dart';
import 'package:sturdy/login_page/CustomIcons.dart';

void main() => runApp(MaterialApp(
  home: EditPage(),
  debugShowCheckedModeBanner: false,
));

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => new _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 1.0, left: 110.0),
                child: Image.asset("assets/signup.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/image_02.png"),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Center(child: FormCardS(),),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          ],
                      ),





                    SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                    SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                    SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                ],
              ),
              ]
              ),

           ),
          )
        ],
      ),
    );
  }
}
