/// name : "IJTIMAATI1"
/// logo : "http://test.conf.ijtimaati.com/api/public/uploads/logos/sqnGRQRcDT.png"

class MyOrganizationsResponseModel {
  String _name;
  String _logo;

  String get name => _name;
  String get logo => _logo;


  set name(String value) {
    _name = value;
  }

  MyOrganizationsResponseModel({
      String name, 
      String logo}){
    _name = name;
    _logo = logo;
}

  MyOrganizationsResponseModel.fromJson(dynamic json) {
    _name = json['name'];
    _logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['logo'] = _logo;
    return map;
  }

  set logo(String value) {
    _logo = value;
  }
}