// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      json['status'] as String,
      json['data'] == null
          ? null
          : new Data.fromJson(json['data'] as Map<String, dynamic>));
}

abstract class _$UserSerializerMixin {
  String get status;
  Data get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'status': status, 'data': data};
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return new Data(
      json['successMsg'] as String,
      json['userId'] as String,
      json['nick'] as String,
      json['phone'] as String,
      json['phoneCertified'] as bool,
      json['personalInfoCompleted'] as bool,
      json['iconUrl'] as String,
      json['easeMobPwd'] as String,
      json['hasService'] as bool,
      json['showRedPoint'] as bool,
      json['hasNewCoupon'] as bool,
      json['hasPendingServiceApply'] as bool,
      json['hasMarket'] as bool,
      json['encPwd'] as String);
}

abstract class _$DataSerializerMixin {
  String get successMsg;
  String get userId;
  String get nick;
  String get phone;
  bool get phoneCertified;
  bool get personalInfoCompleted;
  String get iconUrl;
  String get easeMobPwd;
  bool get hasService;
  bool get showRedPoint;
  bool get hasNewCoupon;
  bool get hasPendingServiceApply;
  bool get hasMarket;
  String get encPwd;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'successMsg': successMsg,
        'userId': userId,
        'nick': nick,
        'phone': phone,
        'phoneCertified': phoneCertified,
        'personalInfoCompleted': personalInfoCompleted,
        'iconUrl': iconUrl,
        'easeMobPwd': easeMobPwd,
        'hasService': hasService,
        'showRedPoint': showRedPoint,
        'hasNewCoupon': hasNewCoupon,
        'hasPendingServiceApply': hasPendingServiceApply,
        'hasMarket': hasMarket,
        'encPwd': encPwd
      };
}
