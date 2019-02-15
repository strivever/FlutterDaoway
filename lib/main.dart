import 'package:flutter/material.dart';
import 'dart:async';
import 'Widgets/Home/GCHome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  //  当所有任务完成后的回调函数
  runApp(HunLiJiApp());
}
class HunLiJiApp extends StatefulWidget {
  @override
  _HunLiJiAppState createState() => _HunLiJiAppState();
}

class _HunLiJiAppState extends State<HunLiJiApp> {
  List<String> bottomTitles = ["首页", "分类", "直约", "订单", "我的"];
  List<List<String>> bottomImages = [
    [
      "lib/static/images/bottomBarIcon/tabBtnNormal_0@2x.png",
      "lib/static/images/bottomBarIcon/tabBtnSelected_0@2x.png"
    ],
    [
      "lib/static/images/bottomBarIcon/tabBtnNormal_1@2x.png",
      "lib/static/images/bottomBarIcon/tabBtnSelected_1@2x.png"
    ],
    [
      "lib/static/images/bottomBarIcon/tabBtnNormal_2@2x.png",
      "lib/static/images/bottomBarIcon/tabBtnSelected_2@2x.png"
    ],
    [
      "lib/static/images/bottomBarIcon/tabBtnNormal_2@2x.png",
      "lib/static/images/bottomBarIcon/tabBtnSelected_2@2x.png"
    ],
    [
      "lib/static/images/bottomBarIcon/tabBtnNormal_3@2x.png",
      "lib/static/images/bottomBarIcon/tabBtnSelected_@2x.png"
    ]
  ];
  int _selectIndex = 0;
  BottomNavigationBarItem createBottomIcon(int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        bottomImages[index][index == _selectIndex ? 1 : 0],
        width: 25,
        height: 25,
      ),
      title: Text(
        bottomTitles[index],
        style: TextStyle(
          color: index == _selectIndex ? Colors.red : Color(0xff888888),
          fontSize: 13,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return MaterialApp(
      theme: ThemeData(
        bottomAppBarColor: Colors.redAccent,
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          items: [
            createBottomIcon(0),
            createBottomIcon(1),
            createBottomIcon(2),
            createBottomIcon(3),
            createBottomIcon(4),
          ],
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
        ),
      ),
    );
  }
}
