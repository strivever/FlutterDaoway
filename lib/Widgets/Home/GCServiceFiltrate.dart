import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:strive_beike/constants/GCConstant.dart';

class GCServiceFiltrateWidget extends StatelessWidget {
  GCServiceFiltrateWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        leading: FlatButton(
          child: Image.asset(
            GCConstant.staticImageSrcBaseUrl + "leftBack@2x.png",
            width: 15,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
            // this.test({"data":"----"});
          },
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 55,
                child: GestureDetector(
                  child: Image.asset(
                    GCConstant.staticImageSrcBaseUrl +
                        "goods_category_list_cart@2x.png",
                    width: 25,
                    height: 25,
                  ),
                  onTap: () {
                    print("购物车");
                  },
                ),
              ),
              Container(
                width: .5,
                height: 20,
                color: Colors.black,
              ),
              Container(
                  width: 55,
                  child: GestureDetector(
                    child: Image.asset(
                      GCConstant.staticImageSrcBaseUrl +
                          "goods_category_list_search@2x.png",
                      width: 25,
                      height: 25,
                    ),
                    onTap: () {
                      print("搜索");
                    },
                  )),
            ],
          )
        ],
      ),
      body: Container(
        child: Text("data"),
        color: Colors.white,
      ),
    );
  }
}
