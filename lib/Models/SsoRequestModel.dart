class SsoRequestModel {
  String email;


  SsoRequestModel(String email) {
    this.email = email;
  }

  SsoRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}