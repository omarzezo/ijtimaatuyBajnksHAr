/// message : "Reset link send to your email,please check it"

class ForgotPasswordResponseModel {
  String _message;

  String get message => _message;

  ForgotPasswordResponseModel({
      String message}){
    _message = message;
}

  ForgotPasswordResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}