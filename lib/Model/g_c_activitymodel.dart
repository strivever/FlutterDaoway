import 'package:json_annotation/json_annotation.dart'; 
  
part 'g_c_activitymodel.g.dart';


@JsonSerializable()
  class GCActivitymodel extends Object with _$GCActivitymodelSerializerMixin{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'subject')
  String subject;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'priority')
  int priority;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'createtime')
  int createtime;

  @JsonKey(name: 'isMarket')
  int isMarket;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'platform')
  String platform;

  @JsonKey(name: 'app')
  String app;

  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'exceptVersion')
  String exceptVersion;

  GCActivitymodel(this.id,this.url,this.img,this.subject,this.title,this.city,this.priority,this.status,this.createtime,this.isMarket,this.type,this.platform,this.app,this.version,this.exceptVersion,);

  factory GCActivitymodel.fromJson(Map<String, dynamic> srcJson) => _$GCActivitymodelFromJson(srcJson);

}

  
