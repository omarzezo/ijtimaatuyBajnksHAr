
import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:itimaaty/Models/AddCommentRequestModel.dart';
import 'package:itimaaty/Models/AddCommentResponseModel.dart';
import 'package:itimaaty/Models/AddMeetingRequestModel.dart';
import 'package:itimaaty/Models/ChangeActionStatusRequestModel.dart';
import 'package:itimaaty/Models/ChangeMeetingStatusRequestModel.dart';
import 'package:itimaaty/Models/ChangeStatusMeetingResponseModel.dart';
import 'package:itimaaty/Models/ChangeStatusResponseModel.dart';
import 'package:itimaaty/Models/DeleteCommentResponse.dart';
import 'package:itimaaty/Models/actions_comment_response_model.dart';
import 'package:itimaaty/Models/actions_response_model.dart';
import 'package:itimaaty/Models/add_meeting_response_model.dart';
import 'package:itimaaty/Models/add_note_request_model.dart';
import 'package:itimaaty/Models/add_note_response_model.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/all_status_response.dart';
import 'package:itimaaty/Models/change_vote_request_model.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/decison_response_model.dart';
import 'package:itimaaty/Models/change_vote_response_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Models/talking_points_response_model.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../Models/UplodedResponseModel.dart';

class MeetingRepository {
  DioHelper _helper = DioHelper();

  // Future<List<AllMeetingsResponse>> getAllMeetings(String token) async {
  //   http.Response response ;
  //   List<AllMeetingsResponse> myModels;
  //   // try{
  //    response = await DioHelper.getWithToken(token , MEETINGS);
  //   print("ResponsIS>>"+response.toString());
  //
  //   myModels = (json.decode(response.body) as List).map((i) =>
  //       AllMeetingsResponse.fromJson(i)).toList();
  //
  //   // }catch (e){
  //   //   print("kkkkkkkkkkkkkk"+e.toString());
  //   // }
  //   return response==null?[]: await myModels;
  // }

  Future<List<AllMeetingsResponse>> getAllMeetings2(String token,String date) async {
    var response ;
    List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+BASE_URL + MEETINGS+'?date='+date);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(BASE_URL + MEETINGS+'?date='+date),headers: headers);
      print("ResponsIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AllMeetingsResponse>> getAllMeetings(String token) async {
    var response ;
    List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+BASE_URL + MEETINGS);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(BASE_URL + MEETINGS),headers: headers);
      print("ResponsIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AllStatusResponse>> getAllStatus(String token) async {
    var response ;
    List<AllStatusResponse> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(BASE_URL + STATUS),headers: headers);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AllStatusResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<CommitteeResponseModel> getAllCommittes(String token) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(token,COMMITTEES);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:CommitteeResponseModel.fromJson(response);
  }

  Future<AddMeetingResponseModel> addMeeting(String token,AddMeetingRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(ADD_MEETINGS,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AddMeetingResponseModel.fromJson(response);
  }

  Future<MeetingDetailsResponseModel> getMeetingDetails(String token,int id) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+BASE_URL + MEETINGS_DETAILS+id.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(token,MEETINGS_DETAILS+id.toString());
      // print("ResponsISss>>"+response);

      // myModels = (json.decode(response.body) as List).map((i) =>
      //     AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:MeetingDetailsResponseModel.fromJson(response);
  }

  Future<int> uploadImage (MultipartFile logoFile,int meeting_id,int library_id,String token) async {

    // http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(BASE_URL+UPDATE_FILE+"/"+id.toString()));
    print("RemoteUrlIs>>"+BASE_URL+UPDATE_FILE);
    print("meeting_id>>"+meeting_id.toString());
    print("library_id>>"+library_id.toString());

    http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(BASE_URL+UPDATE_FILE));
    Map<String, String> headers = {"Content-type": "application/json",
      'token': token};

    Map<String, String> requestBody = <String, String>{
      'meeting_id': meeting_id.toString(),
      'library_id': library_id.toString()
    };

    request.fields.addAll(requestBody);
    request.files.add(logoFile);
    // request.fields['meeting_id'] = meeting_id.toString();
    // request.fields['library_id'] = library_id.toString();
    request.headers.addAll(headers);
    StreamedResponse res;
    request.send().then((response) {
      print("Here>>"+logoFile.toString());
      print(response.toString());
      print("dddd"+response.statusCode.toString());
      res=response;
      // if (response.statusCode == 200){
      //   print("Uploaded!");
      // }else{
      //   print("errror!");
      // }
      // return response.statusCode;
      // var response2 =  http.Response.fromStream(response.stream.bytesToString());
      // final result = jsonDecode(response.) as Map<String, dynamic>;
      // return UplodedResponseModel.fromJson(response.stream);
    });
    return res.statusCode;
    // FormData formData;
    // print("ommmmmmmmmmmmmmmmmmmmmmm");
    // // formData = new FormData.fromMap(
    // //     {}
    // // );
    // formData = FormData();
    // formData.files.add(MapEntry("file", logoFile, ));
    //
    // try{
    //   // formData.files.add(MapEntry('company_logo', logoFile));
    //   print("logoFile");
    // }catch(err){
    //   print("errorIsHersLogo>>");
    //   print("errorIs>>"+err.toString());
    // }
    // Map<String, String> headers = {"Content-type": "application/json",'token': token};
    // print("RemoteUrlIs>>"+BASE_URL+UPDATE_FILE+"/"+id.toString());
    // Response response = await Dio().post(BASE_URL+UPDATE_FILE+"/"+id.toString(), data: formData,
    // options: Options(
    //   // method: 'GET',
    //   headers: {
    //     HttpHeaders.authorizationHeader:
    //     'token $token',
    //     'content-Type': 'application/json'
    //   },
    // ));
    // print("Datais>>" +response.data.toString());

  }

  Future<AddNoteResponseModel> addNote(String token,int id,AddNoteRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(MEETINGS_DETAILS+id.toString()+NOTE,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(response.)
      //   return response;
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AddNoteResponseModel.fromJson(response);
  }


  Future<DecisonResponseModel> getDescisionData(String token,int meetingId,int decisionId) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+BASE_URL + MEETINGS_DETAILS+meetingId.toString()+DECISIONS+decisionId.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(token,MEETINGS_DETAILS+meetingId.toString()+DECISIONS+decisionId.toString());
      // print("ResponsISss>>"+response);

      // myModels = (json.decode(response.body) as List).map((i) =>
      //     AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DecisonResponseModel.fromJson(response);
  }

  Future<List<AddCommentResponseModel>> addComment(String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("usl>>"+BASE_URL + "decisions/"+id.toString()+COMMENT);
      response = await http.post(Uri.parse(BASE_URL + "decisions/"+id.toString()+COMMENT),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  // Future<AddCommentResponseModel> addComment(String token,int id,AddCommentRequestModel model) async {
  //   var response ;
  //   String jsonUser = jsonEncode(model);
  //   print("tokenIs>>>>"+jsonUser.toString());
  //   try{
  //     response = await DioHelper.postWithToken("decisions/"+id.toString()+COMMENT,jsonUser,token);
  //     print("ResponsIS>>"+response.toString());
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //     // if(response.)
  //     //   return response;
  //   }
  //   // print("current_memberIS>>"+response['ongoing'].toString());
  //   // return DashboardResponseModel.fromJson(response);
  //   return response==null?null:AddCommentResponseModel.fromJson(response);
  // }

  Future<ChangeVoteResponseModel> changeVote(String token,int id,ChangeVoteRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken("decisions/"+id.toString()+CHANGE_VOTE,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(response.)
      //   return response;
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:ChangeVoteResponseModel.fromJson(response);
  }

  Future<ChangeStatusResponseModel> changeActionStatus(String token,int id,ChangeActionStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken("actions/"+id.toString()+CHANGE_STATUS,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("ResponsIS>>"+response.toString());
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(response.)
      //   return response;
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:ChangeStatusResponseModel.fromJson(response);
  }

  Future<ChangeStatusMeetingResponseModel> changeMeetingStatus(String token,int id,ChangeMeetingStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(MEETINGS_DETAILS+id.toString()+CHANGE_MEETING_STATUS,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(response.)
      //   return response;
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:ChangeStatusMeetingResponseModel.fromJson(response);
  }


  Future<ActionsResponseModel> getActionData(String token,int meetingId,int decisionId) async {
    var response ;
    print("UrlIs>>"+BASE_URL + ACTIONS+meetingId.toString()+DECISIONS+decisionId.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(token,MEETINGS_DETAILS+meetingId.toString()+ACTIONS+decisionId.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:ActionsResponseModel.fromJson(response);
  }
  Future<TalkingPointsResponseModel> getTalikingPointsData(String token,int meetingId,int decisionId) async {
    var response ;
    print("UrlIs>>"+BASE_URL + ACTIONS+meetingId.toString()+DECISIONS+decisionId.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(token,MEETINGS_DETAILS+meetingId.toString()+TALIKIN_POINTS+decisionId.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:TalkingPointsResponseModel.fromJson(response);
  }

  // Future<ActionsCommentResponseModel> addCommentForAction(String token,int id,AddCommentRequestModel model) async {
  //   var response ;
  //   String jsonUser = jsonEncode(model);
  //   print("tokenIs>>>>"+jsonUser.toString());
  //   try{
  //     response = await DioHelper.postWithToken("actions/"+id.toString()+COMMENT,jsonUser,token);
  //     print("ResponsIS>>"+response.toString());
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //     // if(response.)
  //     //   return response;
  //   }
  //   // print("current_memberIS>>"+response['ongoing'].toString());
  //   // return DashboardResponseModel.fromJson(response);
  //   return response==null?null:ActionsCommentResponseModel.fromJson(response);
  // }

  Future<List<ActionsCommentResponseModel>> addCommentForAction(String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<ActionsCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("UrlIs>>"+BASE_URL + "actions/"+id.toString()+COMMENT);
      response = await http.post(Uri.parse(BASE_URL + "actions/"+id.toString()+COMMENT),headers: headers,body: jsonUser);
      // print("StatusIS>>"+response.t);
      // print("StatusIS>>"+json.encode(response).toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          ActionsCommentResponseModel.fromJson(i)).toList();

      print("StatusIS>>"+myModels.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }


  Future<List<AddCommentResponseModel>> addCommentTalkingPoint(String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("usl>>"+BASE_URL + "talkingpoints/"+id.toString()+COMMENT);
      response = await http.post(Uri.parse(BASE_URL + "talkingpoints/"+id.toString()+COMMENT),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<DeleteCommentResponse> deleteComment(int id,String token) async {
    var response ;
    print("UrlIs>>"+BASE_URL + DELETE_COMMENT+id.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.deleteWithToken(DELETE_COMMENT+"/"+id.toString(),token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DeleteCommentResponse.fromJson(response);
  }
}

