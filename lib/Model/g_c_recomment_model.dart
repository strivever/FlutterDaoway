import 'package:json_annotation/json_annotation.dart'; 
  
part 'g_c_recomment_model.g.dart';


@JsonSerializable()
  class GCRecommentModel extends Object with _$GCRecommentModelSerializerMixin{

  @JsonKey(name: 'categoryId')
  String categoryId;

  @JsonKey(name: 'categoryName')
  String categoryName;

  @JsonKey(name: 'tags')
  String tags;

  @JsonKey(name: 'tagList')
  List<String> tagList;

  @JsonKey(name: 'items')
  List<Items> items;

  GCRecommentModel(this.categoryId,this.categoryName,this.tags,this.tagList,this.items,);

  factory GCRecommentModel.fromJson(Map<String, dynamic> srcJson) => _$GCRecommentModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Items extends Object with _$ItemsSerializerMixin{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'catId')
  String catId;

  @JsonKey(name: 'catName')
  String catName;

  @JsonKey(name: 'serviceId')
  String serviceId;

  @JsonKey(name: 'serviceTitle')
  String serviceTitle;

  @JsonKey(name: 'salesNum')
  int salesNum;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'pic_url')
  String picUrl;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'price_unit')
  String priceUnit;

  @JsonKey(name: 'tags')
  String tags;

  @JsonKey(name: 'originalPrice')
  double originalPrice;

  @JsonKey(name: 'minBuyNum')
  String minBuyNum;

  @JsonKey(name: 'tagIcons')
  List<dynamic> tagIcons;

  @JsonKey(name: 'positiveCommentRate')
  String positiveCommentRate;

  @JsonKey(name: 'orderTakingRate')
  String orderTakingRate;

  @JsonKey(name: 'orderTakingCount')
  int orderTakingCount;

  @JsonKey(name: 'repeatPurchaseRate')
  String repeatPurchaseRate;

  @JsonKey(name: 'inDistanceScope')
  bool inDistanceScope;

  @JsonKey(name: 'isCanChooseTechnician')
  int isCanChooseTechnician;

  @JsonKey(name: 'promotion')
  Promotion promotion;

  @JsonKey(name: 'aheadHours')
  double aheadHours;

  @JsonKey(name: 'showFatestDay')
  bool showFatestDay;

  @JsonKey(name: 'fastestDay')
  String fastestDay;

  @JsonKey(name: 'notice')
  String notice;

  @JsonKey(name: 'groupId')
  String groupId;

  @JsonKey(name: 'supportAppointment')
  int supportAppointment;

  @JsonKey(name: 'appointmentMinBill')
  double appointmentMinBill;

  @JsonKey(name: 'hasVideo')
  bool hasVideo;

  @JsonKey(name: 'eventStartTime')
  int eventStartTime;

  @JsonKey(name: 'eventEndTime')
  int eventEndTime;

  @JsonKey(name: 'startVacation')
  int startVacation;

  @JsonKey(name: 'endVacation')
  int endVacation;

  @JsonKey(name: 'eventPromotionPrice')
  double eventPromotionPrice;

  @JsonKey(name: 'hasEvent')
  bool hasEvent;

  @JsonKey(name: 'booster')
  Booster booster;

  @JsonKey(name: 'isMain')
  int isMain;

  @JsonKey(name: 'recommend')
  bool recommend;

  Items(this.id,this.catId,this.catName,this.serviceId,this.serviceTitle,this.salesNum,this.name,this.description,this.picUrl,this.price,this.priceUnit,this.tags,this.originalPrice,this.minBuyNum,this.tagIcons,this.positiveCommentRate,this.orderTakingRate,this.orderTakingCount,this.repeatPurchaseRate,this.inDistanceScope,this.isCanChooseTechnician,this.promotion,this.aheadHours,this.showFatestDay,this.fastestDay,this.notice,this.groupId,this.supportAppointment,this.appointmentMinBill,this.hasVideo,this.eventStartTime,this.eventEndTime,this.startVacation,this.endVacation,this.eventPromotionPrice,this.hasEvent,this.booster,this.isMain,this.recommend,);

  factory Items.fromJson(Map<String, dynamic> srcJson) => _$ItemsFromJson(srcJson);

}

  
@JsonSerializable()
  class Promotion extends Object with _$PromotionSerializerMixin{

  @JsonKey(name: 'total_reduce')
  List<Total_reduce> totalReduce;

  @JsonKey(name: 'first_reduce')
  double firstReduce;

  @JsonKey(name: 'first_total')
  double firstTotal;

  @JsonKey(name: 'first_reduction')
  List<First_reduction> firstReduction;

  Promotion(this.totalReduce,this.firstReduce,this.firstTotal,this.firstReduction,);

  factory Promotion.fromJson(Map<String, dynamic> srcJson) => _$PromotionFromJson(srcJson);

}

  
@JsonSerializable()
  class Total_reduce extends Object with _$Total_reduceSerializerMixin{

  @JsonKey(name: 'total')
  double total;

  @JsonKey(name: 'reduce')
  double reduce;

  Total_reduce(this.total,this.reduce,);

  factory Total_reduce.fromJson(Map<String, dynamic> srcJson) => _$Total_reduceFromJson(srcJson);

}

  
@JsonSerializable()
  class First_reduction extends Object with _$First_reductionSerializerMixin{

  @JsonKey(name: 'total')
  double total;

  @JsonKey(name: 'reduce')
  double reduce;

  First_reduction(this.total,this.reduce,);

  factory First_reduction.fromJson(Map<String, dynamic> srcJson) => _$First_reductionFromJson(srcJson);

}

  
@JsonSerializable()
  class Booster extends Object with _$BoosterSerializerMixin{

  @JsonKey(name: 'relevance')
  double relevance;

  @JsonKey(name: 'star')
  double star;

  @JsonKey(name: 'saledNum')
  double saledNum;

  @JsonKey(name: 'distance')
  double distance;

  @JsonKey(name: 'level')
  double level;

  @JsonKey(name: 'tag')
  double tag;

  @JsonKey(name: 'company')
  double company;

  @JsonKey(name: 'finalBooster')
  double finalBooster;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'yesterdaySale')
  double yesterdaySale;

  @JsonKey(name: 'monthSale')
  double monthSale;

  @JsonKey(name: 'serviceScore')
  double serviceScore;

  @JsonKey(name: 'aheadhours')
  double aheadhours;

  @JsonKey(name: 'isRecomment')
  double isRecomment;

  @JsonKey(name: 'seq')
  double seq;

  @JsonKey(name: 'onvacation')
  bool onvacation;

  @JsonKey(name: 'orderNum')
  double orderNum;

  Booster(this.relevance,this.star,this.saledNum,this.distance,this.level,this.tag,this.company,this.finalBooster,this.price,this.yesterdaySale,this.monthSale,this.serviceScore,this.aheadhours,this.isRecomment,this.seq,this.onvacation,this.orderNum,);

  factory Booster.fromJson(Map<String, dynamic> srcJson) => _$BoosterFromJson(srcJson);

}

  
