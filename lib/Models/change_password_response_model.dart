/// message : "Password changed successfully"

class ChangePasswordResponseModel {
  String _message;

  String get message => _message;

  ChangePasswordResponseModel({
      String message}){
    _message = message;
}

  ChangePasswordResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}