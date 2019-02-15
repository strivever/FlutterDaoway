import 'package:dio/dio.dart';
import 'NetworkApi.dart';

import 'dart:io';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  Options options;
  static HttpUtil getInstance() {
    if (instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    options = Options(
        baseUrl: NetworkApi.baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {});
  }

  get(String shortUrl, Function sucessCallback,
      {data, Options option, cancleToken, Function errorCallback}) {
    // Map baseData = Map();
    // baseData.addEntries(data);
    // baseData = Map.from({"appVersion":"5.6.2","hasChaoshi":"0","idfa":"E73FE02D-93C5-4921-9CEC-981DD7306E33","includeChaoshi":"1","includeExtCategory":"1","includeSecondPage":"1","manualCity":"","recommendOnly":"1","udid":"E73FE02D-93C5-4921-9CEC-981DD7306E33","userid":"24f8f22cb64646b5bb7ae12d00825448","weidian":"1"});
    _request(shortUrl, sucessCallback,
        params: Map(), errorCallBack: errorCallback, method: "GET");
  }

  void post(shortUrl, Function sucessBack,
      {data, option, cancleToken, Function errorBack}) {
    _request(
      shortUrl,
      sucessBack,
      method: "POST",
      params: data,
      errorCallBack: errorBack,
    );
  }

  void _request(String url, Function callBack,
      {String method, params, Function errorCallBack}) async {
    String errorMsg = "";
    int statusCode;
    try {
      Response response;
      Options option = new Options(
        // 15s 超时时间
        connectTimeout: 15000,
        receiveTimeout: 15000,
        baseUrl: NetworkApi.baseUrl,
        // contentType: Conten
        // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        // contentType:
      );
      Dio _dio = Dio(option);
      if (method == "GET") {
        response = await _dio.get(url, data: params);
      } else {
        response = await _dio.post(url, data: params);
      }
      statusCode = response.statusCode;
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handleError(errorCallBack, errorMsg);
      } else {
        if (callBack != null) {
          callBack(response.data);
        }
      }
    } catch (e) {
      _handleError(errorCallBack, e.toString());
    }
  }

  void _handleError(Function callback, String errorMsg) {
    if (callback != null) {
      callback(errorMsg);
    }
  }
}

class HttpRequestUtil {
  static HttpUtil httpUtil = HttpUtil.getInstance();
  static requestHomeSearchhotKey(Function sucessCallback,
      {data, errorCallback}) async {
    httpUtil.get(NetworkApi.serviceListApi, sucessCallback,
        errorCallback: errorCallback, data: {});
  }

  ///用户登录
  static userLoginWithPhoneCode(
      String phone, String code, Function sucessCallback,
      {data, errorCallback}) async {
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    params.putIfAbsent("code", () => code);
    params.putIfAbsent("phone", () => phone);
    httpUtil.post(
      NetworkApi.userLoginWithPhoneCode,
      sucessCallback,
      data: params,
      errorBack: errorCallback,
    );
  }
  //获取banner数据
  static requestHomeBanners(Function sucessCallback,
      {data, errorCallback}) async {
    //URL	http://api.daoway.cn/daoway/rest/config/banners?appVersion=5.6.3&city=%E6%9D%AD%E5%B7%9E&community_id=588651&idfa=E73FE02D-93C5-4921-9CEC-981DD7306E33&platform=ios&udid=E73FE02D-93C5-4921-9CEC-981DD7306E33
    Map data = {
       "city": "杭州",
      "appVersion": "5.6.3",
      "communityid": "402976",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33"
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.getHomeBannersApi, sucessCallback,
        data: params, errorCallback: errorCallback);
  }
  //获取业务列表
  static requestServiceList(Function sucessCallback,{data,errorCallback})async{
    Map data = {
      "appVersion": "5.6.3",
      "communityid": "402976",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33"
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.serviceListApi, sucessCallback,data:params,errorCallback:errorCallback);
  }

  //获取活动和vip活动
  static requestVipActivitys(Function sucessCallback,{data,errorCallback})async{
    Map data = {
      "appVersion": "5.6.3",
      "city": "杭州",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "type": "all",
      "marketMinLimit":"2",
      "serviceMinLimit":"4",
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.vipEventsApi, sucessCallback,data:params,errorCallback:errorCallback);
  }
  //getServiceItemsRecommendApi

  //获取服务列表
  static requestRecommentList(Function sucessCallback,{data,errorCallback})async{
    Map data = {
      "appVersion": "5.6.3",
      "city": "杭州",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "type": "all",
      "marketMinLimit":"2",
      "serviceMinLimit":"4",
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.getServiceItemsRecommendApi, sucessCallback,data:params,errorCallback:errorCallback);
  }

  static requestHotServicetList(Function sucessCallback,{data,errorCallback})async{
    Map data = {
      "appVersion": "5.6.3",
      "manualQueryCity": "杭州",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "hasChaoshi":false,
      "communityId":678979,
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.getHotTagServerListApi, sucessCallback,data:params,errorCallback:errorCallback);
  }
  static requestServiceitemsWithCategoryID(Function sucessCallback,{data,errorCallback,categoryID})async{
    Map data = {
      "appVersion": "5.6.3",
      "manualQueryCity": "杭州",
      "idfa": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "udid": "E73FE02D-93C5-4921-9CEC-981DD7306E33",
      "hasChaoshi":false,
      "communityId":678979,
      "category":categoryID,
    };
    Map params = Map();
    if (data != null) {
      params.addAll(data);
    }
    httpUtil.get(NetworkApi.getServiceItemWithCategoryID, sucessCallback,data:params,errorCallback:errorCallback);
  }
}
