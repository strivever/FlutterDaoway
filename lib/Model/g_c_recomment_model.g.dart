// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_c_recomment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GCRecommentModel _$GCRecommentModelFromJson(Map<String, dynamic> json) {
  return new GCRecommentModel(
      json['categoryId'] as String,
      json['categoryName'] as String,
      json['tags'] as String,
      (json['tagList'] as List)?.map((e) => e as String)?.toList(),
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : new Items.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$GCRecommentModelSerializerMixin {
  String get categoryId;
  String get categoryName;
  String get tags;
  List<String> get tagList;
  List<Items> get items;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'categoryId': categoryId,
        'categoryName': categoryName,
        'tags': tags,
        'tagList': tagList,
        'items': items
      };
}

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return new Items(
      json['id'] as String,
      json['catId'] as String,
      json['catName'] as String,
      json['serviceId'] as String,
      json['serviceTitle'] as String,
      json['salesNum'] as int,
      json['name'] as String,
      json['description'] as String,
      json['pic_url'] as String,
      (json['price'] as num)?.toDouble(),
      json['price_unit'] as String,
      json['tags'] as String,
      (json['originalPrice'] as num)?.toDouble(),
      json['minBuyNum'] as String,
      json['tagIcons'] as List,
      json['positiveCommentRate'] as String,
      json['orderTakingRate'] as String,
      json['orderTakingCount'] as int,
      json['repeatPurchaseRate'] as String,
      json['inDistanceScope'] as bool,
      json['isCanChooseTechnician'] as int,
      json['promotion'] == null
          ? null
          : new Promotion.fromJson(json['promotion'] as Map<String, dynamic>),
      (json['aheadHours'] as num)?.toDouble(),
      json['showFatestDay'] as bool,
      json['fastestDay'] as String,
      json['notice'] as String,
      json['groupId'] as String,
      json['supportAppointment'] as int,
      (json['appointmentMinBill'] as num)?.toDouble(),
      json['hasVideo'] as bool,
      json['eventStartTime'] as int,
      json['eventEndTime'] as int,
      json['startVacation'] as int,
      json['endVacation'] as int,
      (json['eventPromotionPrice'] as num)?.toDouble(),
      json['hasEvent'] as bool,
      json['booster'] == null
          ? null
          : new Booster.fromJson(json['booster'] as Map<String, dynamic>),
      json['isMain'] as int,
      json['recommend'] as bool);
}

abstract class _$ItemsSerializerMixin {
  String get id;
  String get catId;
  String get catName;
  String get serviceId;
  String get serviceTitle;
  int get salesNum;
  String get name;
  String get description;
  String get picUrl;
  double get price;
  String get priceUnit;
  String get tags;
  double get originalPrice;
  String get minBuyNum;
  List<dynamic> get tagIcons;
  String get positiveCommentRate;
  String get orderTakingRate;
  int get orderTakingCount;
  String get repeatPurchaseRate;
  bool get inDistanceScope;
  int get isCanChooseTechnician;
  Promotion get promotion;
  double get aheadHours;
  bool get showFatestDay;
  String get fastestDay;
  String get notice;
  String get groupId;
  int get supportAppointment;
  double get appointmentMinBill;
  bool get hasVideo;
  int get eventStartTime;
  int get eventEndTime;
  int get startVacation;
  int get endVacation;
  double get eventPromotionPrice;
  bool get hasEvent;
  Booster get booster;
  int get isMain;
  bool get recommend;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'catId': catId,
        'catName': catName,
        'serviceId': serviceId,
        'serviceTitle': serviceTitle,
        'salesNum': salesNum,
        'name': name,
        'description': description,
        'pic_url': picUrl,
        'price': price,
        'price_unit': priceUnit,
        'tags': tags,
        'originalPrice': originalPrice,
        'minBuyNum': minBuyNum,
        'tagIcons': tagIcons,
        'positiveCommentRate': positiveCommentRate,
        'orderTakingRate': orderTakingRate,
        'orderTakingCount': orderTakingCount,
        'repeatPurchaseRate': repeatPurchaseRate,
        'inDistanceScope': inDistanceScope,
        'isCanChooseTechnician': isCanChooseTechnician,
        'promotion': promotion,
        'aheadHours': aheadHours,
        'showFatestDay': showFatestDay,
        'fastestDay': fastestDay,
        'notice': notice,
        'groupId': groupId,
        'supportAppointment': supportAppointment,
        'appointmentMinBill': appointmentMinBill,
        'hasVideo': hasVideo,
        'eventStartTime': eventStartTime,
        'eventEndTime': eventEndTime,
        'startVacation': startVacation,
        'endVacation': endVacation,
        'eventPromotionPrice': eventPromotionPrice,
        'hasEvent': hasEvent,
        'booster': booster,
        'isMain': isMain,
        'recommend': recommend
      };
}

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return new Promotion(
      (json['total_reduce'] as List)
          ?.map((e) => e == null
              ? null
              : new Total_reduce.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['first_reduce'] as num)?.toDouble(),
      (json['first_total'] as num)?.toDouble(),
      (json['first_reduction'] as List)
          ?.map((e) => e == null
              ? null
              : new First_reduction.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$PromotionSerializerMixin {
  List<Total_reduce> get totalReduce;
  double get firstReduce;
  double get firstTotal;
  List<First_reduction> get firstReduction;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'total_reduce': totalReduce,
        'first_reduce': firstReduce,
        'first_total': firstTotal,
        'first_reduction': firstReduction
      };
}

Total_reduce _$Total_reduceFromJson(Map<String, dynamic> json) {
  return new Total_reduce(
      (json['total'] as num)?.toDouble(), (json['reduce'] as num)?.toDouble());
}

abstract class _$Total_reduceSerializerMixin {
  double get total;
  double get reduce;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'total': total, 'reduce': reduce};
}

First_reduction _$First_reductionFromJson(Map<String, dynamic> json) {
  return new First_reduction(
      (json['total'] as num)?.toDouble(), (json['reduce'] as num)?.toDouble());
}

abstract class _$First_reductionSerializerMixin {
  double get total;
  double get reduce;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'total': total, 'reduce': reduce};
}

Booster _$BoosterFromJson(Map<String, dynamic> json) {
  return new Booster(
      (json['relevance'] as num)?.toDouble(),
      (json['star'] as num)?.toDouble(),
      (json['saledNum'] as num)?.toDouble(),
      (json['distance'] as num)?.toDouble(),
      (json['level'] as num)?.toDouble(),
      (json['tag'] as num)?.toDouble(),
      (json['company'] as num)?.toDouble(),
      (json['finalBooster'] as num)?.toDouble(),
      (json['price'] as num)?.toDouble(),
      (json['yesterdaySale'] as num)?.toDouble(),
      (json['monthSale'] as num)?.toDouble(),
      (json['serviceScore'] as num)?.toDouble(),
      (json['aheadhours'] as num)?.toDouble(),
      (json['isRecomment'] as num)?.toDouble(),
      (json['seq'] as num)?.toDouble(),
      json['onvacation'] as bool,
      (json['orderNum'] as num)?.toDouble());
}

abstract class _$BoosterSerializerMixin {
  double get relevance;
  double get star;
  double get saledNum;
  double get distance;
  double get level;
  double get tag;
  double get company;
  double get finalBooster;
  double get price;
  double get yesterdaySale;
  double get monthSale;
  double get serviceScore;
  double get aheadhours;
  double get isRecomment;
  double get seq;
  bool get onvacation;
  double get orderNum;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'relevance': relevance,
        'star': star,
        'saledNum': saledNum,
        'distance': distance,
        'level': level,
        'tag': tag,
        'company': company,
        'finalBooster': finalBooster,
        'price': price,
        'yesterdaySale': yesterdaySale,
        'monthSale': monthSale,
        'serviceScore': serviceScore,
        'aheadhours': aheadhours,
        'isRecomment': isRecomment,
        'seq': seq,
        'onvacation': onvacation,
        'orderNum': orderNum
      };
}
