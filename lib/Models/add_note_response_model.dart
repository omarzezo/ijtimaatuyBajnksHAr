/// message : "User note saved"

class AddNoteResponseModel {
  String _message;

  String get message => _message;

  AddNoteResponseModel({
      String message}){
    _message = message;
}

  AddNoteResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}