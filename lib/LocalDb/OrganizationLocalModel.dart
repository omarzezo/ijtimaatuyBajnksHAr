class OrganizationLocalModel {
  int id;
  String userImage;
  String userName;
  String domain;
  String name;
  String logo;
  String link;
  String email;
  String password;
  String userToken;

  OrganizationLocalModel({this.domain,this.userImage,this.userName,this.email,this.password,this.name, this.logo,this.link,this.userToken});
  OrganizationLocalModel.withId({this.id,this.userImage,this.userName,this.email,this.password,this.domain, this.name, this.logo,this.link,this.userToken});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userImage"] = userImage;
    map["userName"] = userName;
    map["domain"] = domain;
    map["name"] = name;
    map["logo"] = logo;
    map["link"] = link;
    map["email"] = email;
    map["password"] = password;
    map["userToken"] = userToken;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  OrganizationLocalModel.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.userImage = o["userImage"];
    this.userName = o["userName"];
    this.domain = o["domain"];
    this.name = o["name"];
    this.logo = o["logo"];
    this.link = o["link"];
    this.email = o["email"];
    this.password = o["password"];
    this.link = o["link"];
    this.userToken = o["userToken"];
  }
}
