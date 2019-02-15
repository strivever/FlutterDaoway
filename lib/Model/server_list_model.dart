import 'package:json_annotation/json_annotation.dart'; 
  
part 'server_list_model.g.dart';


@JsonSerializable()
  class Serverlistmodel extends Object with _$ServerlistmodelSerializerMixin{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  @JsonKey(name: 'iconUrl2')
  String iconUrl2;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'hasService')
  bool hasService;

  @JsonKey(name: 'subCategory')
  bool subCategory;

  Serverlistmodel(this.id,this.name,this.count,this.iconUrl,this.iconUrl2,this.order,this.tags,this.description,this.hasService,this.subCategory,);

  factory Serverlistmodel.fromJson(Map<String, dynamic> srcJson) => _$ServerlistmodelFromJson(srcJson);

}

  
