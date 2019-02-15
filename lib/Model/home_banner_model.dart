import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_banner_model.g.dart';


@JsonSerializable()
  class HomeBannerModel extends Object with _$HomeBannerModelSerializerMixin{

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'gold_banners')
  List<dynamic> goldBanners;

  @JsonKey(name: 'data')
  List<Data> data;

  HomeBannerModel(this.status,this.goldBanners,this.data,);

  factory HomeBannerModel.fromJson(Map<String, dynamic> srcJson) => _$HomeBannerModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Data extends Object with _$DataSerializerMixin{

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'target')
  String target;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'platform')
  String platform;

  @JsonKey(name: 'areaInclude')
  String areaInclude;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'sharePicUrl')
  String sharePicUrl;

  @JsonKey(name: 'shareTitile')
  String shareTitile;

  @JsonKey(name: 'shareContent')
  String shareContent;

  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'exceptVersion')
  String exceptVersion;

  @JsonKey(name: 'serviceId')
  String serviceId;

  @JsonKey(name: 'isChaoshi')
  int isChaoshi;

  @JsonKey(name: 'h5Url')
  String h5Url;

  @JsonKey(name: 'end')
  int end;

  @JsonKey(name: 'goldBanner')
  int goldBanner;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'app')
  String app;

  Data(this.imgUrl,this.target,this.type,this.platform,this.areaInclude,this.city,this.sharePicUrl,this.shareTitile,this.shareContent,this.version,this.exceptVersion,this.serviceId,this.isChaoshi,this.h5Url,this.end,this.goldBanner,this.channel,this.app,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
