/// id : 53

class MultipleLikeRequestModel {
  MultipleLikeRequestModel({
      int id,}){
    _id = id;
}

  MultipleLikeRequestModel.fromJson(dynamic json) {
    _id = json['id'];
  }
  int _id;

  int get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }

}