class NetworkApi{
  //get  domain url
  static const String baseUrl = "http://api.daoway.cn";
  //get请求 获取服务列表数据
  static const String serviceListApi = "/daoway/rest/category/for_filter?appVersion=5.6.3&hasChaoshi=false&idfa=E73FE02D-93C5-4921-9CEC-981DD7306E33&includeChaoshi=true&includeExtCategory=true&includeSecondPage=true&manualCity=%E6%9D%AD%E5%B7%9E&recommendOnly=true&udid=E73FE02D-93C5-4921-9CEC-981DD7306E33&userId=24f8f22cb64646b5bb7ae12d00825448&weidian=false";
  //获取banner /daoway/rest/config/banners
  static const String getHomeBannersApi = "/daoway/rest/config/banners";
  //get 请求  获取热门维修
  ///http://api.daoway.cn/daoway/rest/category/hotwithtags?appVersion=5.6.3&communityId=678350&hasChaoshi=false&idfa=E73FE02D-93C5-4921-9CEC-981DD7306E33&manualQueryCity=%E9%94%A1%E6%9E%97%E9%83%AD%E5%8B%92%E7%9B%9F&udid=E73FE02D-93C5-4921-9CEC-981DD7306E33
  static const String getHotTagServerListApi ="/daoway/rest/category/hotwithtags";
  //get 获取服务多级列表
  ///http://api.daoway.cn/daoway/rest/service_items/recommend_top?appVersion=5.6.3&idfa=E73FE02D-93C5-4921-9CEC-981DD7306E33&lat=43.94217300415039&lot=116.0278244018555&manualCity=%E9%94%A1%E6%9E%97%E9%83%AD%E5%8B%92%E7%9B%9F&udid=E73FE02D-93C5-4921-9CEC-981DD7306E33
  static const String getServiceItemsRecommendApi ="/daoway/rest/service_items/recommend_top";
  //会员福利api get请求
  ///http://api.daoway.cn/daoway/rest/indexEvent/all?appVersion=5.6.3&city=%E9%94%A1%E6%9E%97%E9%83%AD%E5%8B%92%E7%9B%9F&idfa=E73FE02D-93C5-4921-9CEC-981DD7306E33&marketMinLimit=2&serviceMinLimit=4&type=all&udid=E73FE02D-93C5-4921-9CEC-981DD7306E33
  static const String vipEventsApi = "/daoway/rest/indexEvent/all";
  //根据服务ID获取服务项目列表
  static const String getServiceItemWithCategoryID = "/daoway/rest/category/for_filter";
  ///----------------------------------------------------------------------------///
  //post
  //用户验证码登录
  static const String userLoginWithPhoneCode = "/daoway/rest/users/login_phone";
}