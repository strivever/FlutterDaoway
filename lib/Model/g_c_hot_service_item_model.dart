import 'package:json_annotation/json_annotation.dart'; 
  
part 'g_c_hot_service_item_model.g.dart';


@JsonSerializable()
  class GCHotServiceItemModel extends Object with _$GCHotServiceItemModelSerializerMixin{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'catId')
  String catId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hot')
  bool hot;

  @JsonKey(name: 'hasService')
  bool hasService;

  @JsonKey(name: 'tagImgUrl')
  String tagImgUrl;

  @JsonKey(name: 'tagColorfulImgUrl')
  String tagColorfulImgUrl;

  GCHotServiceItemModel(this.id,this.catId,this.name,this.hot,this.hasService,this.tagImgUrl,this.tagColorfulImgUrl,);

  factory GCHotServiceItemModel.fromJson(Map<String, dynamic> srcJson) => _$GCHotServiceItemModelFromJson(srcJson);

}

  
