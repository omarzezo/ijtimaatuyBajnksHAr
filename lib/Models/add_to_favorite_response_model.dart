/// message : "dir saved"

class AddToFavoriteResponseModel {
  String _message;

  String get message => _message;

  AddToFavoriteResponseModel({
      String message}){
    _message = message;
}

  AddToFavoriteResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}