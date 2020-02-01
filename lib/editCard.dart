import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCardS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(700),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("EDIT PROFILE",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/image_01.png'),
              radius: 70.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10.0),
            ),
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            Text("Instagram Link",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  hintText: "Instagram Link",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            Text("Biography",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  hintText: "Biography",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            InkWell(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(330),
                height: ScreenUtil.getInstance().setHeight(100),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF17ead9),
                      Color(0xFF6078ea)
                    ]),
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text("DONE",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins-Bold",
                              fontSize: 18,
                              letterSpacing: 1.0)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
