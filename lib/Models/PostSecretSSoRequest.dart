class PostSecretSSoRequest {
  String secret;


  PostSecretSSoRequest(String secret) {
    this.secret = secret;
  }

  PostSecretSSoRequest.fromJson(Map<String, dynamic> json) {
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secret'] = this.secret;
    return data;
  }
}