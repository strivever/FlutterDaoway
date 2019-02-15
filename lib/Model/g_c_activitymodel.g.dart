// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_c_activitymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GCActivitymodel _$GCActivitymodelFromJson(Map<String, dynamic> json) {
  return new GCActivitymodel(
      json['id'] as String,
      json['url'] as String,
      json['img'] as String,
      json['subject'] as String,
      json['title'] as String,
      json['city'] as String,
      json['priority'] as int,
      json['status'] as int,
      json['createtime'] as int,
      json['isMarket'] as int,
      json['type'] as int,
      json['platform'] as String,
      json['app'] as String,
      json['version'] as String,
      json['exceptVersion'] as String);
}

abstract class _$GCActivitymodelSerializerMixin {
  String get id;
  String get url;
  String get img;
  String get subject;
  String get title;
  String get city;
  int get priority;
  int get status;
  int get createtime;
  int get isMarket;
  int get type;
  String get platform;
  String get app;
  String get version;
  String get exceptVersion;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'img': img,
        'subject': subject,
        'title': title,
        'city': city,
        'priority': priority,
        'status': status,
        'createtime': createtime,
        'isMarket': isMarket,
        'type': type,
        'platform': platform,
        'app': app,
        'version': version,
        'exceptVersion': exceptVersion
      };
}
