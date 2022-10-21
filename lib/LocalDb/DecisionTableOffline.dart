class DecisionTableOffline {
  int id;
  String url;
  String addNoteRequest;
  String changeUserStatusRequest;
  String statusReason;
  String changeDecisionVote;
  String changeDecisionReason;
  String addDecisionComment;
  int deleteDecisionComment;
  String userProfile;
  int like;
  int unLike;


  DecisionTableOffline({this.url,this.addNoteRequest,this.like,this.unLike,this.userProfile,this.deleteDecisionComment,this.changeUserStatusRequest,this.addDecisionComment,this.statusReason,this.changeDecisionReason,this.changeDecisionVote});
  DecisionTableOffline.withId({this.id,this.url,this.like,this.unLike,this.userProfile,this.deleteDecisionComment,this.addNoteRequest,this.addDecisionComment,this.changeUserStatusRequest,this.statusReason,this.changeDecisionReason,this.changeDecisionVote});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["url"] = url;
    map["addNoteRequest"] = addNoteRequest;
    map["changeUserStatusRequest"] = changeUserStatusRequest;
    map["statusReason"] = statusReason;
    map["changeDecisionVote"] = changeDecisionVote;
    map["changeDecisionReason"] = changeDecisionReason;
    map["addDecisionComment"] = addDecisionComment;
    map["deleteDecisionComment"] = deleteDecisionComment;
    map["userProfile"] = userProfile;
    map["like"] = like;
    map["unLike"] = unLike;
    map["id"] = id;
    // if (id != null) {
    //   map["id"] = id;
    // }
    return map;
  }

  DecisionTableOffline.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.url = o["url"];
    this.addNoteRequest = o["addNoteRequest"];
    this.changeUserStatusRequest = o["changeUserStatusRequest"];
    this.statusReason = o["statusReason"];
    this.changeDecisionVote = o["changeDecisionVote"];
    this.changeDecisionReason = o["changeDecisionReason"];
    this.addDecisionComment = o["addDecisionComment"];
    this.deleteDecisionComment = o["deleteDecisionComment"];
    this.userProfile = o["userProfile"];
    this.like = o["like"];
    this.unLike = o["unLike"];
  }

}
