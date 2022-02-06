/// old_password : "123123"
/// password : "123456"

class ChangePasswordRequestModel {
  String _oldPassword;
  String _password;

  String get oldPassword => _oldPassword;
  String get password => _password;

  ChangePasswordRequestModel({
      String oldPassword, 
      String password}){
    _oldPassword = oldPassword;
    _password = password;
}

  ChangePasswordRequestModel.fromJson(dynamic json) {
    _oldPassword = json['old_password'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['old_password'] = _oldPassword;
    map['password'] = _password;
    return map;
  }

}