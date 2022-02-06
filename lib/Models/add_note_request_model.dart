/// note : "my note for meeting"

class AddNoteRequestModel {
  String _note;

  String get note => _note;

  AddNoteRequestModel({
      String note}){
    _note = note;
}

  AddNoteRequestModel.fromJson(dynamic json) {
    _note = json['note'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['note'] = _note;
    return map;
  }

}