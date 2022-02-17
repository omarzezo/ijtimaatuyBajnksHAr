/// id : 1
/// name : "Draft"
/// bgcolor : "#f4f6f8"
/// color : "#909497"

class AllStatusResponse {
  int _id;
  String _name;
  String _bgcolor;
  String _color;

  int get id => _id;
  String get name => _name;
  String get bgcolor => _bgcolor;
  String get color => _color;


  set name(String value) {
    _name = value;
  }

  AllStatusResponse({
      int id, 
      String name, 
      String bgcolor, 
      String color}){
    _id = id;
    _name = name;
    _bgcolor = bgcolor;
    _color = color;
}

  AllStatusResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _bgcolor = json['bgcolor'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['bgcolor'] = _bgcolor;
    map['color'] = _color;
    return map;
  }

}