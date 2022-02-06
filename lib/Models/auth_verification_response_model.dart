/// code : "197406"

class AuthVerificationResponseModel {
  String _code;

  String get code => _code;

  AuthVerificationResponseModel({
      String code}){
    _code = code;
}

  AuthVerificationResponseModel.fromJson(dynamic json) {
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    return map;
  }

}