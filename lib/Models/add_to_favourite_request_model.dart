/// type : "dir"
/// type_id : "1"

class AddToFavouriteRequestModel {
  String _type;
  String _typeId;

  String get type => _type;
  String get typeId => _typeId;

  AddToFavouriteRequestModel({
      String type, 
      String typeId}){
    _type = type;
    _typeId = typeId;
}

  AddToFavouriteRequestModel.fromJson(dynamic json) {
    _type = json['type'];
    _typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = _type;
    map['type_id'] = _typeId;
    return map;
  }

}