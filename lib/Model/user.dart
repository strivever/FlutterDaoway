import 'package:json_annotation/json_annotation.dart'; 
  
part 'user.g.dart';


@JsonSerializable()
  class User extends Object with _$UserSerializerMixin{

  String status;

  Data data;

  User(this.status,this.data,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}

  
@JsonSerializable()
  class Data extends Object with _$DataSerializerMixin{

  String successMsg;

  String userId;

  String nick;

  String phone;

  bool phoneCertified;

  bool personalInfoCompleted;

  String iconUrl;

  String easeMobPwd;

  bool hasService;

  bool showRedPoint;

  bool hasNewCoupon;

  bool hasPendingServiceApply;

  bool hasMarket;

  String encPwd;

  Data(this.successMsg,this.userId,this.nick,this.phone,this.phoneCertified,this.personalInfoCompleted,this.iconUrl,this.easeMobPwd,this.hasService,this.showRedPoint,this.hasNewCoupon,this.hasPendingServiceApply,this.hasMarket,this.encPwd,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
