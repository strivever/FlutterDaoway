import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'GCLeftIconTitleButton.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:strive_beike/constants/GCColorsConstant.dart';
import 'package:strive_beike/Network/HttpUtil.dart';
import 'package:strive_beike/Model/UserInfo.dart';

import 'package:strive_beike/Model/user.dart';
class GCNavgationSerachbar extends StatefulWidget
    implements PreferredSizeWidget {
  GCNavgationSerachbar({Key key, @required this.child})
      : assert(child != null),
        super(key: key);
  final Widget child;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(64.0);
  @override
  _GCNavgationSerachbarState createState() => _GCNavgationSerachbarState();
}

class _GCNavgationSerachbarState extends State<GCNavgationSerachbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 88,
      // color: Colors.blue,
      child: widget.child,
    );
  }
}

class GCSearchbar extends StatefulWidget {
  @override
  _GCSearchbarState createState() => _GCSearchbarState();
}

class _GCSearchbarState extends State<GCSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GCLeftIconTitleButton(
            image: Image.asset(
                "lib/static/images/HomeImages/icon_card_location_mark_1@2x.png",
                width: 15,
                height: 15),
            title: Text(
              "杭州",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              print("定位");
            },
          ),
          SizedBox(
            width: 10,
          ),
          GCSearchView(),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.message),
        ],
      ),
    );
  }
}

class GCSearchView extends StatefulWidget {
  @override
  _GCSearchViewState createState() => _GCSearchViewState();
}

class _GCSearchViewState extends State<GCSearchView> {
  bool isShowClearBtn = false;
  String searchKW = "";
  TextEditingController inputController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    inputController.dispose();
  }

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      print(inputController.text);
    });
    // HttpRequestUtil.requestHomeSearchhotKey(
    //   (data){
    //     print(data);
    //   },
    //   errorCallback: (errorMsg){
    //     print(errorMsg);
    //   },
    //   data: {},
    // );
    HttpRequestUtil.userLoginWithPhoneCode("15136179843", "9218", (data){
      print(data);
      UserInfo userInfo = UserInfo();
      User user = User.fromJson(data);
      userInfo.user = user;

    },errorCallback: (errorMsg){

    },data: {"appVersion":"5.6.3","communityid":"402976","idfa":"E73FE02D-93C5-4921-9CEC-981DD7306E33","udid":"E73FE02D-93C5-4921-9CEC-981DD7306E33"});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: GestureDetector(
        child: _buildContainer(),
        onTap: () {
          print("点击");
        },
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: 36,
      child: _buildSearchStack(),
      decoration: _buildDecoration(),
    );
  }

  Widget _buildSearchStack() {
    return Stack(
      children: <Widget>[
        _buildSearchIcon(),
        _buildSearchTextField(),
        isShowClearBtn == true
            ? Positioned(
                child: Icon(Icons.clear),
                right: 20,
                width: 10,
                height: 10,
                top: 6,
              )
            : null,
      ].where((it) => it != null).toList(),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: GCColorsConstant.searchBarBgColor,
      border: Border.all(
        color: GCColorsConstant.searchBarBgColor,
        width: 0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }

  Widget _buildSearchIcon() {
    return Positioned(
      left: 5,
      top: 10,
      child: Icon(
        Icons.search,
        size: 20,
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Positioned(
      left: 30,
      right: 40,
      height: 36,
      bottom: 3,
      child: TextField(
        controller: inputController,
        autofocus: true,
        decoration: _buildSearchTextFieldDecoration(),
        textAlign: TextAlign.left,
        enabled: false,
        onSubmitted: (text) {
          print("提交");
        },
        onEditingComplete: () {
          setState(() {
            isShowClearBtn = false;
          });
        },
        onChanged: (text) {
          if (text.length > 0) {
            setState(() {
              isShowClearBtn = true;
            });
          }else{
            setState(() {
              isShowClearBtn = false;
            });
          }
        },
        onTap: () {
          print("跳转");
        },
      ),
    );
  }

  InputDecoration _buildSearchTextFieldDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: searchKW,
      hintStyle: TextStyle(),
    );
  }
  // Widget _buildSearchButton(){
  //   return
  // }
}
