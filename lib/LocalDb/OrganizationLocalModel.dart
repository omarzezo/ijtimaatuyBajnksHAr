class OrganizationLocalModel {
  int id;
  String name;
  String logo;

  OrganizationLocalModel({this.name, this.logo});
  OrganizationLocalModel.withId({this.id, this.name, this.logo});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["logo"] = logo;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  OrganizationLocalModel.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.name = o["name"];
    this.logo = o["logo"];
  }
}
