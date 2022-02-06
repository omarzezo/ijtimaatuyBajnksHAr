/// message : "Password changed successfully"

class ResetPasswordResponseModel {
  String _message;

  String get message => _message;

  ResetPasswordResponseModel({
      String message}){
    _message = message;
}

  ResetPasswordResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}