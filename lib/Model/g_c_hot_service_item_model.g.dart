// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_c_hot_service_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GCHotServiceItemModel _$GCHotServiceItemModelFromJson(
    Map<String, dynamic> json) {
  return new GCHotServiceItemModel(
      json['id'] as String,
      json['catId'] as String,
      json['name'] as String,
      json['hot'] as bool,
      json['hasService'] as bool,
      json['tagImgUrl'] as String,
      json['tagColorfulImgUrl'] as String);
}

abstract class _$GCHotServiceItemModelSerializerMixin {
  String get id;
  String get catId;
  String get name;
  bool get hot;
  bool get hasService;
  String get tagImgUrl;
  String get tagColorfulImgUrl;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'catId': catId,
        'name': name,
        'hot': hot,
        'hasService': hasService,
        'tagImgUrl': tagImgUrl,
        'tagColorfulImgUrl': tagColorfulImgUrl
      };
}
