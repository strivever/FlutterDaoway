// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerModel _$HomeBannerModelFromJson(Map<String, dynamic> json) {
  return new HomeBannerModel(
      json['status'] as String,
      json['gold_banners'] as List,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : new Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$HomeBannerModelSerializerMixin {
  String get status;
  List<dynamic> get goldBanners;
  List<Data> get data;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'gold_banners': goldBanners,
        'data': data
      };
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return new Data(
      json['imgUrl'] as String,
      json['target'] as String,
      json['type'] as String,
      json['platform'] as String,
      json['areaInclude'] as String,
      json['city'] as String,
      json['sharePicUrl'] as String,
      json['shareTitile'] as String,
      json['shareContent'] as String,
      json['version'] as String,
      json['exceptVersion'] as String,
      json['serviceId'] as String,
      json['isChaoshi'] as int,
      json['h5Url'] as String,
      json['end'] as int,
      json['goldBanner'] as int,
      json['channel'] as String,
      json['app'] as String);
}

abstract class _$DataSerializerMixin {
  String get imgUrl;
  String get target;
  String get type;
  String get platform;
  String get areaInclude;
  String get city;
  String get sharePicUrl;
  String get shareTitile;
  String get shareContent;
  String get version;
  String get exceptVersion;
  String get serviceId;
  int get isChaoshi;
  String get h5Url;
  int get end;
  int get goldBanner;
  String get channel;
  String get app;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'imgUrl': imgUrl,
        'target': target,
        'type': type,
        'platform': platform,
        'areaInclude': areaInclude,
        'city': city,
        'sharePicUrl': sharePicUrl,
        'shareTitile': shareTitile,
        'shareContent': shareContent,
        'version': version,
        'exceptVersion': exceptVersion,
        'serviceId': serviceId,
        'isChaoshi': isChaoshi,
        'h5Url': h5Url,
        'end': end,
        'goldBanner': goldBanner,
        'channel': channel,
        'app': app
      };
}
