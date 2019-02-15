// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Serverlistmodel _$ServerlistmodelFromJson(Map<String, dynamic> json) {
  return new Serverlistmodel(
      json['id'] as String,
      json['name'] as String,
      json['count'] as int,
      json['iconUrl'] as String,
      json['iconUrl2'] as String,
      json['order'] as int,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['description'] as String,
      json['hasService'] as bool,
      json['subCategory'] as bool);
}

abstract class _$ServerlistmodelSerializerMixin {
  String get id;
  String get name;
  int get count;
  String get iconUrl;
  String get iconUrl2;
  int get order;
  List<String> get tags;
  String get description;
  bool get hasService;
  bool get subCategory;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'count': count,
        'iconUrl': iconUrl,
        'iconUrl2': iconUrl2,
        'order': order,
        'tags': tags,
        'description': description,
        'hasService': hasService,
        'subCategory': subCategory
      };
}
