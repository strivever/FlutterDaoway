import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:strive_beike/GCComponentView/GCLeftIconTitleButton.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:strive_beike/Network/HttpUtil.dart';
import 'package:strive_beike/Model/home_banner_model.dart';
import 'package:strive_beike/Model/server_list_model.dart';
import 'package:strive_beike/constants/GCColorsConstant.dart';
import 'package:strive_beike/Model/g_c_activitymodel.dart';
import 'package:strive_beike/Model/g_c_recomment_model.dart';
import 'package:strive_beike/Model/g_c_hot_service_item_model.dart';

import 'GCServiceFiltrate.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller;
  Color color = Colors.white;
  List<Data> bannerDatas = [];
  List<Serverlistmodel> serverList = [];
  List<Serverlistmodel> fastServerList = [];
  List<GCActivitymodel> activitysList = [];
  List<GCRecommentModel> recommentLists = [];
  List<GCHotServiceItemModel> hotItemList = [];
  List<GCActivitymodel> vipModels = [];
  ScrollController _serverListController;
  PageController _pageController = PageController(viewportFraction: 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _serverListController = ScrollController();
    _controller = ScrollController();
    _controller.addListener(() {
      print(_controller.position.pixels);
      if (_controller.position.pixels >= 100) {
        setState(() {
          color = Colors.black;
        });
      } else {
        setState(() {
          color = Colors.white;
        });
      }
      print("-------");
      print(_controller.position.physics);
    });

    HttpRequestUtil.requestHomeBanners((data) {
      HomeBannerModel model = HomeBannerModel.fromJson(data);
      setState(() {
        bannerDatas = model.data;
      });
    }, data: {}, errorCallback: (errorMsg) {});
    HttpRequestUtil.requestServiceList((data) {
      print("requestServiceList");
      print(data);
      List<Serverlistmodel> list = [];
      List<Serverlistmodel> fastlist = [];
      for (var item in data["data"]) {
        Serverlistmodel model = Serverlistmodel.fromJson(item);
        list.add(model);
      }
      for (var item in data["ext"]) {
        Serverlistmodel model = Serverlistmodel.fromJson(item);
        fastlist.add(model);
        // PopupMenuButton();
      }
      setState(() {
        serverList = list;
        fastServerList = fastlist;
      });
    }, errorCallback: (errorMsg) {});
    HttpRequestUtil.requestVipActivitys((data) {
      List<GCActivitymodel> activitys = [];
      List acList = [
        {
          "id": "9cba62be681a470cba999f77a70972dc",
          "url":
              "http://www.daoway.cn/activity/index.html?id=af21e937103e441ca3a9ac3cc4a913ef",
          "h5Url": null,
          "img":
              "http://img.daoway.cn/img/banners/2019/01/24/1feb1c8e-358f-48e1-99c6-be1609ea2e8b.png",
          "subject": "上门打针，陪护就诊",
          "title": "医护陪诊",
          "city":
              "北京 成都 长沙 重庆 长春 大连 福州 广州 杭州 哈尔滨 济南 南京 青岛 上海 深圳 苏州 天津 武汉 西安 厦门 郑州 佛山 石家庄 鞍山 安顺 安庆 南昌 合肥 宁波 安康 安阳 无锡 太原 昆明 贵阳 包头 白银 蚌埠 齐齐哈尔 曲靖 秦皇岛 钦州 泉州 庆阳 七台河 沈阳 阿拉善盟 宝鸡 保山 毕节 保定 白山 百色 白城 巴音郭楞蒙古自治州 滨州 北海 本溪 巴中 潮州 池州 崇左 沧州 朝阳 承德 郴州 常德 滁州 常州 赤峰 长治 德州 定西 东莞 达州 大庆 丹东 东营 德阳 大同 鄂尔多斯 鄂州 抚顺 阜阳 抚州 防城港 阜新 广安 广元 赣州 贵港 固原 桂林 海口 惠州 黑河 葫芦岛 淮南 呼和浩特 衡水 淮北 海东地区 黄冈 贺州 黄石 邯郸 鹤岗 衡阳 鹤壁 湖州 呼伦贝尔 汉中 河池 淮安 菏泽 河源 黄山 怀化 景德镇 酒泉 济宁 嘉峪关 金昌 吉林 揭阳 鸡西 焦作 九江 嘉兴 晋城 荆州 锦州 江门 金华 晋中 荆门 吉安 佳木斯 克拉玛依 开封 兰州 临汾 拉萨 吕梁 陇南 柳州 洛阳 丽水 六盘水 临沂 聊城 辽源 丽江 乐山 连云港 龙岩 临沧 辽阳 来宾 莱芜 廊坊 娄底 六安 眉山 梅州 牡丹江 茂名 绵阳 马鞍山 南宁 那曲地区 南通 南平 南充 宁德 南阳 内江 攀枝花 盘锦 平凉 普洱 平顶山 萍乡 莆田 日照 清远 绥化 商洛 上饶 韶关 宿迁 遂宁 三亚 石嘴山 四平 三明 汕头 十堰 双鸭山 邵阳 绍兴 朔州 松原 宿州 汕尾 商丘 随州 三门峡 铁岭 铜陵 泰州 泰安 台州 铜仁 通化 通辽 天水 铜川 唐山 乌鲁木齐 温州 芜湖 乌海 吴忠 梧州 渭南 武威 潍坊 乌兰察布 威海 西宁 襄阳 湘潭 咸阳 徐州 新余 邢台 新乡 忻州 兴安盟 锡林郭勒盟 孝感 咸宁 许昌 宣城 信阳 银川 扬州 阳泉 玉溪 延安 玉林 岳阳 宜昌 鹰潭 烟台 营口 伊春 运城 榆林 宜宾 永州 宜春 盐城 阳江 云浮 雅安 益阳 伊犁哈萨克自治州 株洲 驻马店 周口 资阳 自贡 珠海 淄博 遵义 枣庄 昭通 中卫 漳州 张掖 张家口 舟山 中山 张家界 镇江 肇庆 湛江",
          "priority": 11,
          "status": 1,
          "createtime": 1542097229000,
          "starttime": 1542333600000,
          "endtime": null,
          "isMarket": 0,
          "type": 0,
          "platform": "ios,android",
          "app": "dw",
          "version": "",
          "exceptVersion": ""
        },
        {
          "id": "f9a963ef1cf94ebebd172afcc7c35614",
          "url":
              "http://www.daoway.cn/activity/index.html?id=bd147b548f554d0d9f587de32f5acbf8",
          "h5Url": null,
          "img":
              "http://img.daoway.cn/img/banners/2019/01/15/5957b715-ffe3-4d3d-be6c-789868b34602.png",
          "subject": "专业服务,价格透明",
          "title": "上门安装",
          "city": "全国",
          "priority": 28,
          "status": 1,
          "createtime": 1529459421000,
          "starttime": null,
          "endtime": null,
          "isMarket": 0,
          "type": 0,
          "platform": "ios,android",
          "app": "dw",
          "version": "",
          "exceptVersion": ""
        },
        {
          "id": "ed12c4f539c649549ea5d31342b36b75",
          "url":
              "http://www.daoway.cn/activity/index.html?id=680f8f59efaf4564b75773c18f729310",
          "h5Url": null,
          "img":
              "http://img.daoway.cn/img/banners/2019/01/15/f40faca7-1305-418f-8610-aac9d7d63432.png",
          "subject": "免费上门取送",
          "title": "洗衣洗鞋",
          "city": "全国",
          "priority": 29,
          "status": 1,
          "createtime": 1539249734000,
          "starttime": null,
          "endtime": null,
          "isMarket": 0,
          "type": 0,
          "platform": "ios,android",
          "app": "dw",
          "version": "",
          "exceptVersion": ""
        }
      ];
      for (var item in acList) {
        GCActivitymodel model = GCActivitymodel.fromJson(item);
        activitys.add(model);
      }
      List<GCActivitymodel> vips = [];
      for (var item in data["data"]) {
        GCActivitymodel model = GCActivitymodel.fromJson(item);
        vips.add(model);
      }
      setState(() {
        activitysList = activitys;
        vipModels = vips;
      });
    }, errorCallback: (errorMsg) {
      print(errorMsg);
    });

    HttpRequestUtil.requestRecommentList((data) {
      List<GCRecommentModel> recomment_list = [];
      for (var item in data["data"]) {
        GCRecommentModel model = GCRecommentModel.fromJson(item);
        recomment_list.add(model);
      }
      setState(() {
        recommentLists = recomment_list;
      });
    }, errorCallback: (errorMsg) {});
    HttpRequestUtil.requestHotServicetList((data) {
      print(data);
      print("object");
      List<GCHotServiceItemModel> hotList = [];
      for (var item in data["data"]) {
        GCHotServiceItemModel model = GCHotServiceItemModel.fromJson(item);
        hotList.add(model);
      }
      setState(() {
        hotItemList = hotList;
      });
    }, errorCallback: (errorMsg) {});
  }

  List<Widget> _buildRecommentWidgets() {
    List<Widget> list = [];
    for (var item in recommentLists) {
      list.add(Container(
        height: 15,
      ));
      list.add(GCServiceListWidget(
        model: item,
      ));
    }
    return list;
  }

  List<VipListWidget> _buildVipWidgets() {
    List<VipListWidget> widgets = [];
    for (var model in vipModels) {
      VipListWidget widget = VipListWidget(
        title: model.title,
        subTitle: model.subject,
        bgImageName: "lib/static/images/HomeImages/home_activity_bg_3@2x.png",
        imageUrl: model.img,
        width: (MediaQuery.of(context).size.width - 20 - 15) / 4.0,
      );
      widgets.add(widget);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            title: Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  GCLeftIconTitleButton(
                    image: Image.asset(
                      "lib/static/images/HomeImages/icon_card_location_mark_1@2x.png",
                      width: 12,
                      height: 12,
                    ),
                    title: Text(
                      "滨康小区东",
                      style: TextStyle(fontSize: 15, color: color),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 155,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: bannerDatas.isEmpty
                  ? null
                  : Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return CachedNetworkImage(
                          imageUrl: bannerDatas[index].imgUrl,
                          fit: BoxFit.fill,
                          errorWidget: Icon(Icons.error),
                          placeholder: Image.asset(
                              "lib/static/images/HomeImages/icon_card_location_mark_1@2x.png"),
                        );
                      },
                      itemCount: bannerDatas.length,
                      // indicatorLayout:PageIndicatorLayout.COLOR,
                      pagination: SwiperPagination(
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        alignment: Alignment.bottomRight,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.white,
                          size: 7,
                          activeSize: 7,
                        ),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              // padding: EdgeInsets.only(top:20),
              height: (MediaQuery.of(context).size.width - 20 - 20) / 5 * 2 +
                  5 +
                  30 +
                  50,
              child: Stack(
                children: <Widget>[
                  Container(
                    // color: Colors.green,
                    height:
                        (MediaQuery.of(context).size.width - 20 - 20) / 5 * 2 +
                            5 +
                            50,
                    margin: EdgeInsets.only(bottom: 30),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: serverList.length % 10 == 0
                          ? serverList.length ~/ 10
                          : serverList.length ~/ 10 + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _serverListController,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int idx) {
                            return GestureDetector(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: serverList[index * 10 + idx]
                                            .iconUrl2,
                                        placeholder: Image.asset(
                                          "lib/static/images/imgSrc/food.jpeg",
                                          width: 30,
                                          height: 30,
                                        ),
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      serverList[index * 10 + idx].name,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                print(
                                    "点击了${serverList[index * 10 + idx].name}");
                              },
                            );
                          },
                          itemCount: (serverList.length - index * 10) > 10
                              ? 10
                              : (serverList.length - index * 10),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                (MediaQuery.of(context).size.width - 20 - 20) /
                                    4,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: PageIndicator(
                        controller: _pageController,
                        count: serverList.length % 10 == 0
                            ? serverList.length ~/ 10
                            : serverList.length ~/ 10 + 1,
                        color: Colors.grey,
                        activeColor: Colors.redAccent,
                        size: 7,
                        activeSize: 7,
                      ),
                    ),
                    left: 10,
                    right: 10,
                    bottom: 10,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "即刻达",
                        style: TextStyle(
                          color: GCColorsConstant.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "最快30分钟上门",
                        style: TextStyle(
                          color: GCColorsConstant.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color: Colors.green,
                    height: (MediaQuery.of(context).size.width - 20 - 4) / 5,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _serverListController,
                      itemBuilder: (BuildContext context, int index) {
                        return GCListCellWidget(
                          index: index,
                          tapCellListCallBack: (idx) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context){
                                return GCServiceFiltrateWidget(title: "大保健",);
                              }
                            ));
                          },
                          title: fastServerList[index].name,
                          imageLocalUrl: "lib/static/images/imgSrc/food.jpeg",
                          imageUrl: fastServerList[index].iconUrl2,
                          imageHeight: 30,
                          imageWidth: 30,
                          isClipOval: false,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 1,
                        childAspectRatio: 1,
                        maxCrossAxisExtent:
                            (MediaQuery.of(context).size.width - 20 - 4) / 5,
                      ),
                      itemCount: fastServerList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: activitysList.length == 0
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      height: 195,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GCActivityWidget(
                              model: activitysList[0],
                              isHorizontal: false,
                              bgImageSrc:
                                  "lib/static/images/HomeImages/home_activity_bg_1_big@2x.png",
                            ),
                          ),
                          Container(
                            width: 5,
                            //  color: Colors.grey,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: GCActivityWidget(
                                    isHorizontal: true,
                                    model: activitysList[1],
                                    bgImageSrc:
                                        "lib/static/images/HomeImages/home_activity_bg_2@2x.png",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GCActivityWidget(
                                    isHorizontal: true,
                                    model: activitysList[2],
                                    bgImageSrc:
                                        "lib/static/images/HomeImages/home_activity_bg_3@2x.png",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: _buildRecommentWidgets(),
          )),
          SliverToBoxAdapter(
            child: GCListHeaderWidget(
              title: "热门服务",
              isColorMark: false,
              moreTitle: "全部分类",
            
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, index) {
                return GCListCellWidget(
                  index: index,
                  title: hotItemList[index].name,
                  imageUrl: hotItemList[index].tagImgUrl,
                  imageLocalUrl: "lib/static/images/imgSrc/food.jpeg",
                  tapCellListCallBack: (index) {},
                  isClipOval: false,
                  imageHeight: 25,
                  imageWidth: 25,
                );
              }, childCount: hotItemList.length >= 10 ? 10 : 0),
            ),
          ),
          SliverToBoxAdapter(
            child: GCListHeaderWidget(
              title: "会员福利",
              isColorMark: false,
              moreTitle: "优选服务商",
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildVipWidgets(),
            ),
          ))
        ],
      ),
    );
  }
}

typedef tapCellListCallBack = void Function(int index);

class GCListCellWidget extends StatefulWidget {
  GCListCellWidget(
      {Key key,
      this.index,
      this.imageUrl,
      this.imageLocalUrl,
      this.title,
      this.imageWidth,
      this.imageHeight,
      this.isClipOval,
      this.tapCellListCallBack})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String imageLocalUrl;
  final int index;
  final tapCellListCallBack;
  final double imageWidth;
  final double imageHeight;
  final bool isClipOval;
  @override
  _GCListCellWidgetState createState() => _GCListCellWidgetState();
}

class _GCListCellWidgetState extends State<GCListCellWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // color: Colors.redAccent,
        child: Column(
          children: <Widget>[
            widget.isClipOval
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      placeholder: Image.asset(widget.imageLocalUrl),
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      fit: BoxFit.contain,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    placeholder: Image.asset(widget.imageLocalUrl),
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    fit: BoxFit.contain,
                  ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      onTap: () {
        widget.tapCellListCallBack(widget.index);
      },
    );
  }
}

class GCActivityWidget extends StatefulWidget {
  GCActivityWidget({Key key, this.isHorizontal, this.model, this.bgImageSrc})
      : super(key: key);
  //是否水平
  final bool isHorizontal;
  final GCActivitymodel model;
  final String bgImageSrc;
  @override
  _GCActivityWidgetState createState() => _GCActivityWidgetState();
}

class _GCActivityWidgetState extends State<GCActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // alignment: const FractionalOffset(1,1),
        children: <Widget>[
          Positioned(
            child: Image.asset(
              widget.bgImageSrc,
              fit: BoxFit.cover,
            ),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          widget.isHorizontal
              ? _buildHorizontalWidget()
              : _buildVerticalWidget()
        ],
      ),
    );
  }

  Widget _buildHorizontalWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 5, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.model.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.model.subject,
                  style: TextStyle(
                    fontSize: 13,
                    color: GCColorsConstant.textColor,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.model.img,
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.model.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.orange,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.model.subject,
            style: TextStyle(
              fontSize: 13,
              color: GCColorsConstant.textColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.model.img,
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}

class GCServiceListWidget extends StatefulWidget {
  GCServiceListWidget({Key key, this.model}) : super(key: key);
  final GCRecommentModel model;
  @override
  _GCServiceListWidgetState createState() => _GCServiceListWidgetState();
}

class _GCServiceListWidgetState extends State<GCServiceListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 16,
                    width: 5,
                    color: Colors.blue,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      widget.model.categoryName,
                      style: TextStyle(
                          color: GCColorsConstant.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "更多",
                        style: TextStyle(
                            fontSize: 12, color: GCColorsConstant.textColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "lib/static/images/HomeImages/nextGray@2x.png",
                        width: 8,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CommonServiceListCell(
                  items: widget.model.items.first,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: CommonServiceListCell(items: widget.model.items[1]),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: CommonServiceListCell(
                  items: widget.model.items[2],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }
}

class CommonServiceListCell extends StatefulWidget {
  CommonServiceListCell({Key key, this.items}) : super(key: key);
  final Items items;
  @override
  _CommonServiceListCellState createState() => _CommonServiceListCellState();
}

class _CommonServiceListCellState extends State<CommonServiceListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CachedNetworkImage(
              width: (MediaQuery.of(context).size.width - 20) / 3.0,
              height: (MediaQuery.of(context).size.width - 20) / 3.0,
              imageUrl: widget.items.picUrl,
              fit: BoxFit.fill,
              // placeholder: Image.asset("lib/static/images/imgSrc/food.jpeg"),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.items.name,
            // maxLines: 1,
            style: TextStyle(fontSize: 15, color: GCColorsConstant.textColor),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.items.salesNum.toString() + widget.items.priceUnit,
                style: TextStyle(fontSize: 15, color: Colors.redAccent),
              ),
              // Container(
              //   child: Text(
              //     "首减10元",
              //     style: TextStyle(
              //       fontSize: 12,
              //       color: Colors.red,
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     // color: Colors.redAccent,
              //     border: new Border.all(color: Colors.redAccent, width: 1.0,),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "lib/static/images/HomeImages/goodsItem_store@2x.png",
                width: 10,
                height: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.items.serviceTitle,
                style: TextStyle(
                  fontSize: 12,
                  color: GCColorsConstant.textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GCListHeaderWidget extends StatefulWidget {
  GCListHeaderWidget({Key key, this.title, this.moreTitle, this.isColorMark})
      : super(key: key);
  final String title;
  final String moreTitle;
  final bool isColorMark;
  @override
  _GCListHeaderWidgetState createState() => _GCListHeaderWidgetState();
}

class _GCListHeaderWidgetState extends State<GCListHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Container(
      padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
      child: Column(
        children: <Widget>[
          // Container(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  children: <Widget>[
                widget.isColorMark
                    ? Container(
                        height: 16,
                        width: 5,
                        color: Colors.blue,
                      )
                    : null,
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: GCColorsConstant.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ].where((it) => it != null).toList()),
              GestureDetector(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.moreTitle,
                        style: TextStyle(
                            fontSize: 12, color: GCColorsConstant.textColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "lib/static/images/HomeImages/nextGray@2x.png",
                        width: 8,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VipListWidget extends StatefulWidget {
  VipListWidget(
      {Key key,
      this.title,
      this.subTitle,
      this.imageUrl,
      this.bgImageName,
      this.width})
      : super(key: key);
  final String title;
  final String subTitle;
  final String imageUrl;
  final String bgImageName;
  final double width;
  @override
  _VipListWidgetState createState() => _VipListWidgetState();
}

class _VipListWidgetState extends State<VipListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              widget.bgImageName,
              fit: BoxFit.cover,
            ),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 15, color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.subTitle,
                  style: TextStyle(
                      fontSize: 12, color: GCColorsConstant.textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  width: 35,
                  height: 35,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
