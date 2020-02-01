import 'package:flutter/material.dart';
import 'package:sturdy/login_page/login_page.dart';
import '../home_page/navigation_bloc.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "MATHEMATICS",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "PHYSICS",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "CHEMISTRY",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "COMPUTER",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "GEOGRAPHY",
    img: "assets/setting.png",
  );
  Items item6 = new Items(
    title: "HISTORY",
    img: "assets/setting.png",
  );
  Items item7 = new Items(
    title: "COMMERCIAL STUDIES",
    img: "assets/todo.png",
  );
  Items item8 = new Items(
    title: "ECONOMICS",
    img: "assets/setting.png",
  );
  Items item9 = new Items(
    title: "ACCOUNTS",
    img: "assets/setting.png",
  );
  Items item10 = new Items(
    title: "BIOLOGY",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item7, item8, item9, item10];
    var color = 0xFF00838F;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Align(alignment: Alignment(0,12),
                    child: Text(
                        data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                  ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            );
          }
          ).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title, this.img});
}