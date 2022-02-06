/// id : 24
/// author : 35
/// name : "today's news 23/11/2021"
/// committee_id : 8
/// video : null
/// content : "In application we have used location part in pdf and in chat.  To remove the location part required one hour. i will share you one build please confirm the build so we can push to store"
/// image_url : "http://test.app.ijtimaati.com/api/public/uploads/images/news/todays-news-0.jfif"
/// comments_count : 19
/// likes_count : 4
/// liked : true
/// gallery : [{"id":17,"news_id":24,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/news/todays-news-0.jfif","deleted_at":null,"created_at":"2021-11-23T07:33:01.000000Z","updated_at":"2021-11-23T07:33:01.000000Z"}]

class AddCommentResponseModel {
  int _id;
  int _author;
  String _name;
  int _committeeId;
  dynamic _video;
  String _content;
  String _imageUrl;
  int _commentsCount;
  int _likesCount;
  bool _liked;
  List<Gallery> _gallery;

  int get id => _id;
  int get author => _author;
  String get name => _name;
  int get committeeId => _committeeId;
  dynamic get video => _video;
  String get content => _content;
  String get imageUrl => _imageUrl;
  int get commentsCount => _commentsCount;
  int get likesCount => _likesCount;
  bool get liked => _liked;
  List<Gallery> get gallery => _gallery;

  AddCommentResponseModel({
      int id, 
      int author, 
      String name, 
      int committeeId, 
      dynamic video, 
      String content, 
      String imageUrl, 
      int commentsCount, 
      int likesCount, 
      bool liked, 
      List<Gallery> gallery}){
    _id = id;
    _author = author;
    _name = name;
    _committeeId = committeeId;
    _video = video;
    _content = content;
    _imageUrl = imageUrl;
    _commentsCount = commentsCount;
    _likesCount = likesCount;
    _liked = liked;
    _gallery = gallery;
}

  AddCommentResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _author = json['author'];
    _name = json['name'];
    _committeeId = json['committee_id'];
    _video = json['video'];
    _content = json['content'];
    _imageUrl = json['image_url'];
    _commentsCount = json['comments_count'];
    _likesCount = json['likes_count'];
    _liked = json['liked'];
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery.add(Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['author'] = _author;
    map['name'] = _name;
    map['committee_id'] = _committeeId;
    map['video'] = _video;
    map['content'] = _content;
    map['image_url'] = _imageUrl;
    map['comments_count'] = _commentsCount;
    map['likes_count'] = _likesCount;
    map['liked'] = _liked;
    if (_gallery != null) {
      map['gallery'] = _gallery.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 17
/// news_id : 24
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/news/todays-news-0.jfif"
/// deleted_at : null
/// created_at : "2021-11-23T07:33:01.000000Z"
/// updated_at : "2021-11-23T07:33:01.000000Z"

class Gallery {
  int _id;
  int _newsId;
  String _image;
  dynamic _deletedAt;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  int get newsId => _newsId;
  String get image => _image;
  dynamic get deletedAt => _deletedAt;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Gallery({
      int id, 
      int newsId, 
      String image, 
      dynamic deletedAt, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _newsId = newsId;
    _image = image;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Gallery.fromJson(dynamic json) {
    _id = json['id'];
    _newsId = json['news_id'];
    _image = json['image'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['news_id'] = _newsId;
    map['image'] = _image;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}