import 'dart:async';

import 'package:itimaatysoharsohar/LocalDb/DecisionTableOffline.dart';
import 'package:itimaatysoharsohar/Models/DeleteCommentsRequestModel.dart';
import 'package:itimaatysoharsohar/Models/MultipleLikeRequestModel.dart';
import 'package:itimaatysoharsohar/Models/add_news_comment.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Models/AddCommentRequestModel.dart';
import '../Models/AddCommentResponseModel.dart';
import 'OfflineDataLocalModel.dart';
import 'OrganizationLocalModel.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "ijmeet.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        "Create table organizations("
            "id integer primary key,"
            " userImage text, "
            "userName text,"
            " domain text, "
            "name text, "
            "logo text,"
            "link text,"
            "email text,"
            "password text,"
            "userToken text)");

    batch.execute(
        "Create table offlineTable("
            "id integer primary key,"
            " url text,"
            " dashboard text,"
            " allMeetingsDashboard text,"
            " allMeetings text, "
            "allMeetingsDetails text, "
            "profile text, "
            "news text, "
            "newsDetails text, "
            "talkingPoint text, "
            "decision text, "
            "action text)"
    );
    batch.execute(
        "Create table requestsTable("
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
            // "id INTEGER PRIMARY KEY ,"
            // "id INTEGER ,"
            "url text,"
            "addNoteRequest text,"
            "statusReason text,"
            "changeUserStatusRequest text,"
        // "changeUserStatusRequest text,"
            "changeDecisionVote text,"
            "changeDecisionReason text,"
            "addDecisionComment text,"
            "userProfile text,"
            "like INTEGER,"
            "unLike INTEGER,"
            "deleteDecisionComment INTEGER)"
    );


    batch.commit();
  }

  Future<int> insertRequestsData(DecisionTableOffline requestsTableOffline) async {
    Database db = await this.db;
    // print("requestMAp>>"+requestsTableOffline.toMap().toString());
    var result = await db.insert("requestsTable", requestsTableOffline.toMap());
    return result;
  }


  Future<List<DecisionTableOffline>> getUserProfile(String url) async {
    var dbClient = await db;
    String query = "SELECT url , userProfile FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return DecisionTableOffline.fromObject(result[i]);
    });
  }
  Future<void> updateUserProfile(String url,String addNoteRequest) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE requestsTable SET userProfile = ? WHERE url = ?', [addNoteRequest, url]);
    return result;
  }

  Future<int> deleteUserProfile({List<dynamic> whereArgs}) async {
    Database db = await this.db;
    print("deleteeeed");
    return db.delete(
      "requestsTable",
      where: "url = ?",
      whereArgs: whereArgs,
    );
  }

  Future<List> getNoteRequest(String url) async {
    var dbClient = await db;
    String query = "SELECT url , addNoteRequest FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return DecisionTableOffline.fromObject(result[i]);
    });
  }
  Future<void> updateNoteRequest(String url,String addNoteRequest) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE requestsTable SET addNoteRequest = ? WHERE url = ?', [addNoteRequest, url]);
    return result;
  }

  Future<List> getStatus(String url) async {
    var dbClient = await db;
    String query = "SELECT url , changeUserStatusRequest , statusReason  FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return DecisionTableOffline.fromObject(result[i]);
    });
  }

  Future<void> updateStatus(String url,String changeUserStatusRequest ,String statusReason) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE requestsTable SET changeUserStatusRequest = ? , statusReason = ? WHERE url = ?', [changeUserStatusRequest, statusReason,url]);
    return result;
  }

// ________________________________________________________________________
  Future<List> getMeetingDecision(String url) async {
    var dbClient = await db;
    String query = "SELECT url , changeDecisionVote , changeDecisionReason  FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return DecisionTableOffline.fromObject(result[i]);
    });
  }

  Future<void> updateMeetingDecision(String url,String changeDecisionVote ,String changeDecisionReason) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE requestsTable SET changeDecisionVote = ? , changeDecisionReason = ? WHERE url = ?', [changeDecisionVote, changeDecisionReason,url]);
    return result;
  }

  // Future<void> deleteVoteDecision(String url) async {
  //   Database db = await this.db;
  //   var result = await db.rawUpdate("DELETE  FROM requestsTable WHERE url = '" + url + "' ");
  //   return result;
  // }

// ________________________________________________________________________

  // ________________________________________________________________________
  Future<List> getMeetingActions(String url) async {
    var dbClient = await db;
    String query = "SELECT url , changeDecisionVote FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return DecisionTableOffline.fromObject(result[i]);
    });
  }

  Future<void> updateMeetingActions(String url,String changeDecisionVote) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE requestsTable SET changeDecisionVote = ? WHERE url = ?', [changeDecisionVote,url]);
    return result;
  }

  // Future<void> deleteVoteAction(String url) async {
  //   Database db = await this.db;
  //   var result = await db.rawUpdate("DELETE  FROM requestsTable WHERE url = '" + url + "' ");
  //   return result;
  // }

// ________________________________________________________________________


  Future<List<MultipleLikeRequestModel>> getMultipleLike(String url) async {
    var dbClient = await db;
    List<MultipleLikeRequestModel> list=[];
    String query = "SELECT id , url , like  FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    List.generate(result.length, (i) {
      list.add(MultipleLikeRequestModel(id:result[i]["like"] ));
    });
    return await list;
  }

  Future<List<MultipleLikeRequestModel>> getMultipleUnLike(String url) async {
    var dbClient = await db;
    List<MultipleLikeRequestModel> list=[];
    String query = "SELECT id , url , unLike  FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    List.generate(result.length, (i) {
      list.add(MultipleLikeRequestModel(id:result[i]["unLike"] ));
    });
    return await list;
  }
  // ________________________________________________________________________
  Future<List<AddCommentRequestModel>> getDecisionComment(String url) async {
    var dbClient = await db;
    List<AddCommentRequestModel> list=[];
    String query = "SELECT id , url , addDecisionComment  FROM requestsTable WHERE url = '" + url + "' ;";
    print("query>>"+query);
    var result = await dbClient.rawQuery(query);
     List.generate(result.length, (i) {
      list.add(AddCommentRequestModel(comment:result[i]["addDecisionComment"] ));
    });
    return await list;
  }

  Future<List<AddNewsComment>> getNewsComment(String url) async {
    var dbClient = await db;
    List<AddNewsComment> list=[];
    String query = "SELECT id , url , addDecisionComment  FROM requestsTable WHERE url = '" + url + "' ;";
    print("query>>"+query);
    var result = await dbClient.rawQuery(query);
    List.generate(result.length, (i) {
      list.add(AddNewsComment(comment:result[i]["addDecisionComment"] ));
    });
    return await list;
  }

  Future<void> deleteDecisionComment(int id) async {
    Database db = await this.db;
    var result = await db.rawUpdate("DELETE  FROM requestsTable WHERE id = '" + id.toString() + "' ");
    return result;
  }

  Future<int> deleteAllDecisionComments({List<dynamic> whereArgs}) async {
    Database db = await this.db;
    return db.delete(
      "requestsTable",
      where: "url = ?",
      whereArgs: whereArgs,
    );
  }

  Future<int> deleteStoredDecisionComment({List<dynamic> whereArgs}) async {
    Database db = await this.db;
    return db.delete(
      "requestsTable",
      where: "id = ?",
      whereArgs: whereArgs,
    );
  }

  // Future<int> deleteStoredDecisionComment(int id,String deleteDecisionComment) async {
  //   Database db = await this.db;
  //   String query = "DELETE  FROM requestsTable WHERE id = " + id.toString() + " ";
  //   print(query);
  //   // var mmm = await db.rawQuery(query);
  //   // print("mmmmmm>>"+mmm.toString());
  //   var result = await db.delete(query);
  //   return result;
  // }

// ________________________________________________________________________

  // ________________________________________________________________________
  Future<List<DeleteCommentsRequestModel>> getDeleteDecisionComment(String url) async {
    var dbClient = await db;
    List<DeleteCommentsRequestModel> list=[];
    String query = "SELECT id , url , deleteDecisionComment  FROM requestsTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    print("result>>"+query.toString());
    List.generate(result.length, (i) {
      print("fffffff>>"+result[i]["deleteDecisionComment"].toString());
      list.add(DeleteCommentsRequestModel(comment:result[i]["deleteDecisionComment"] ));
    });
    return await list;

    // var dbClient = await db;
    // String query = "SELECT id , url , deleteDecisionComment   FROM requestsTable ";
    // var result = await dbClient.rawQuery(query);
    // return List.generate(result.length, (i) {
    //   return DecisionTableOffline.fromObject(result[i]);
    // });
  }


  // Future<void> deleteRow(String url) async {
  //   Database db = await this.db;
  //   var result = await db.rawUpdate("DELETE  FROM requestsTable WHERE id = '" + url.toString() + "' ");
  //   return result;
  // }
  Future<int> deleteRow({List<dynamic> whereArgs}) async {
    Database db = await this.db;
    return db.delete(
      "requestsTable",
      where: "url = ?",
      whereArgs: whereArgs,
    );
  }
// ________________________________________________________________________

  Future<List> getOrganizations() async {
    try {
      Database db = await this.db;
      var result = await db.query("organizations");
      //return result;
      return List.generate(result.length, (i) {
        return OrganizationLocalModel.fromObject(result[i]);
      });
    }catch(Ex){

    }
  }

  Future<int> insert(OrganizationLocalModel product) async {
    try {
      Database db = await this.db;
      var result = await db.insert("organizations", product.toMap());
      return result;
    }catch(ex){

    }
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from organizations where id= $id");
    return result;
  }

  Future<void> update(OrganizationLocalModel product) async {
    Database db = await this.db;
    var result = await db.update("organizations", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
    return result;
  }
  // Future<void> updateWithName(OrganizationLocalModel product) async {
  //   Database db = await this.db;
  //   var result = await db.update("organizations", product.toMap(),
  //       where: "domain=?", whereArgs: [product.domain]);
  //   return result;
  // }

  Future<void> updateWithName(String token,String name,String userImage,String domain,String email,String password) async {
  try {
    Database db = await this.db;
    // var result = await db.rawUpdate('UPDATE organizations SET userToken = ? and userName = ? WHERE domain = ?', [token, name,domain]);
    var result = await db.rawUpdate(
        'UPDATE organizations SET userToken = ? WHERE domain = ?',
        [token, domain]);
    result = await db.rawUpdate(
        'UPDATE organizations SET userName = ? WHERE domain = ?',
        [name, domain]);
    result = await db.rawUpdate(
        'UPDATE organizations SET userImage = ? WHERE domain = ?',
        [userImage, domain]);
    result = await db.rawUpdate(
        'UPDATE organizations SET email = ? WHERE domain = ?', [email, domain]);
    result = await db.rawUpdate(
        'UPDATE organizations SET password = ? WHERE domain = ?',
        [password, domain]);
    return result;
    // var result = await db.update("organizations", product.toMap(),
  }catch(ex){

  } //     where: "domain=?", whereArgs: [product.domain]);

  }


  Future<List> getOfflineData() async {
    Database db = await this.db;
    var result = await db.query("offlineTable");
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getDashboardColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , dashboard FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
    // return result.toList();
  }

  Future<List> getAllMeetingsDashboardColumn(String url) async {
    var dbClient = await db;
    // String query = "SELECT  url , allMeetingsDashboard FROM offlineTable WHERE url = '" + url + "' ;";
    String query = "SELECT url , allMeetingsDashboard FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getNewsColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , news FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
    // return result.toList();
  }

  Future<List> getNewsDetailsColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , newsDetails FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getProfileColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , profile FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getAllMeetingsColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , allMeetings FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getAllMeetingsDetailsColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , allMeetingsDetails FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    print("length>>"+result.length.toString());
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getTalkingPointColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , talkingPoint FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    // print("length>>"+result.length.toString());
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getDecisionColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , decision FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    // print("length>>"+result.length.toString());
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<List> getActionColumn(String url) async {
    var dbClient = await db;
    String query = "SELECT url , action FROM offlineTable WHERE url = '" + url + "' ;";
    var result = await dbClient.rawQuery(query);
    // print("length>>"+result.length.toString());
    return List.generate(result.length, (i) {
      return OfflineDataLocalModel.fromObject(result[i]);
    });
  }

  Future<int> insertOfflineData(OfflineDataLocalModel product) async {
    Database db = await this.db;
    var result = await db.insert("offlineTable", product.toMap());
    return result;
  }

  Future<int> deleteOfflineData(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from offlineTable where id= $id");
    return result;
  }

  Future<void> updateOfflineData(OfflineDataLocalModel product) async {
    Database db = await this.db;
    var result = await db.update("offlineTable", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
    return result;
  }

  Future<void> updateWithNameOfflineData(String url,String allMeetings) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET allMeetings = ? WHERE url = ?', [allMeetings, url]);
    return result;
  }

  Future<void> updateMeetingDetails(String url,String allMeetingsDetails) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET allMeetingsDetails = ? WHERE url = ?', [allMeetingsDetails, url]);
    return result;
  }

  Future<void> updateNews(String url,String news) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET news = ? WHERE url = ?', [news, url]);
    return result;
  }
  Future<void> updateNewsDetails(String url,String newsDetails) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET newsDetails = ? WHERE url = ?', [newsDetails, url]);
    return result;
  }

  Future<void> updateProfile(String url,String profile) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET profile = ? WHERE url = ?', [profile, url]);
    return result;
  }

  Future<void> updateDashboard(String url,String dashboard) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET dashboard = ? WHERE url = ?', [dashboard, url]);
    return result;
  }
  Future<void> updateMeetingsDasboard(String url,String allMeetingsDashboard) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET allMeetingsDashboard = ? WHERE url = ?', [allMeetingsDashboard, url]);
    return result;
  }

  Future<void> updateTalkingPoint(String url,String talkingPoint) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET talkingPoint = ? WHERE url = ?', [talkingPoint, url]);
    return result;
  }

  Future<void> updateDecision(String url,String talkingPoint) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET decision = ? WHERE url = ?', [talkingPoint, url]);
    return result;
  }

  Future<void> updateAction(String url,String talkingPoint) async {
    Database db = await this.db;
    var result = await db.rawUpdate('UPDATE offlineTable SET action = ? WHERE url = ?', [talkingPoint, url]);
    return result;
  }
}
