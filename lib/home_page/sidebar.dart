import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sturdy/Mentor/mentor.dart';
import 'package:sturdy/Time/main.dart';
import 'package:sturdy/calculator/scientificCalculator.dart';
import 'package:sturdy/discussion.dart';
import 'package:sturdy/home_page/dashboard.dart';
import 'package:sturdy/money.dart';
import 'package:sturdy/profile.dart';

import '../home_page/navigation_bloc.dart';
import '../home_page/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFFE0F7FA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      ListTile(
                        title: Text(
                          "USERNAME",
                          style: TextStyle(color: Color(0xFF00838F), fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile() ),);
                        },
                        subtitle: Text(
                          "www.email@gmail.com",
                          style: TextStyle(
                            color: Color(0xFF00838F),
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Color(0xFF00838F).withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "COURSE PAGE",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.EbookClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "MODEL PAPERS",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CourseMaterialClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "MENTOR",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mentor() ),);
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "DAILY QUESTIONS",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DailyQuestionClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "DISCUSSIONS",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Discussion() ),);
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "WEEKLY EXPENSE",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Money() ),);
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "TIME MANAGEMENT",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Time() ),);
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "SCIENTIFIC CALCI",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScientificCalculator() ),);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 30,
                      height: 100,
                      color: Color(0xFFE0F7FA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF00838F),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}