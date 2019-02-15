import 'user.dart';
class UserInfo {
  User user;
  // 工厂模式
  factory UserInfo() =>_getInstance();
  static UserInfo get instance => _getInstance();
  static UserInfo _instance;
  UserInfo._internal() {
    // 初始化
  }
  static UserInfo _getInstance() {
    if (_instance == null) {
      _instance = new UserInfo._internal();
    }
    return _instance;
  }
}