import 'dart:convert';
import 'package:http/http.dart';
import 'package:itimaatysoharsohar/Models/AddCommentRequestModel.dart';
import 'package:itimaatysoharsohar/Models/AddCommentResponseModel.dart';
import 'package:itimaatysoharsohar/Models/AddMeetingRequestModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeActionStatusRequestModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeMeetingStatusRequestModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeStatusMeetingResponseModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeStatusResponseModel.dart';
import 'package:itimaatysoharsohar/Models/DeleteCommentResponse.dart';
import 'package:itimaatysoharsohar/Models/DeleteCommentsRequestModel.dart';
import 'package:itimaatysoharsohar/Models/actions_comment_response_model.dart';
import 'package:itimaatysoharsohar/Models/actions_response_model.dart';
import 'package:itimaatysoharsohar/Models/add_meeting_response_model.dart';
import 'package:itimaatysoharsohar/Models/add_note_request_model.dart';
import 'package:itimaatysoharsohar/Models/add_note_response_model.dart';
import 'package:itimaatysoharsohar/Models/all_meetings_response.dart';
import 'package:itimaatysoharsohar/Models/all_status_response.dart';
import 'package:itimaatysoharsohar/Models/change_vote_request_model.dart';
import 'package:itimaatysoharsohar/Models/committee_response_model.dart';
import 'package:itimaatysoharsohar/Models/dashboard_response_model.dart';
import 'package:itimaatysoharsohar/Models/decison_response_model.dart';
import 'package:itimaatysoharsohar/Models/change_vote_response_model.dart';
import 'package:itimaatysoharsohar/Models/metting_details_response_model.dart';
import 'package:itimaatysoharsohar/Models/talking_points_response_model.dart';
import 'package:itimaatysoharsohar/network/end_points.dart';
import 'package:itimaatysoharsohar/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../Models/SignatureRequestModel.dart';
import '../Models/SignatureResponseModel.dart';
import '../Models/UplodedResponseModel.dart';
import '../Utils/Constants.dart';
import '../network/DioHelper.dart';

class MeetingRepository {

  // Future<List<AllMeetingsResponse>> getAllMeetingsUsingDio2(String token,String date) async {
  //   // hasNetwork().then((value) {
  //   //   if(value){
  //   //     print("Net exist");
  //   //   }else{
  //   //     print("No Net exist");
  //   //   }
  //   // });
  //   var response ;
  //   List<AllMeetingsResponse> myModels;
  //   print("UrlIs>>"+Constants.BASE_URL + Constants.MEETINGS+'?date='+date);
  //   try{
  //     response = await DioHelperDio.getData(url: Constants.MEETINGS+'?date='+date,token: token);
  //     print("ResponsIS>>"+response.toString());
  //     myModels = (response.data as List).map((i) => AllMeetingsResponse.fromJson(i)).toList();
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //   }
  //   return response==null?[]: await myModels;
  // }


  // Future<List<AllMeetingsResponse>> getAllMeetings2(String baseUrl,String token,String date) async {
  Future<String> getAllMeetings2(String baseUrl,String token,String date,int page,
      String attendance,
      String committee,
      String meeting_status_id,
      String role,
      ) async {
    var response ;
    Map<String,String> query = {};

    if(attendance != null && attendance.isNotEmpty ) query['attendance'] = attendance.toString();
    if(committee != null && committee.isNotEmpty ) query['committee'] = committee.toString();
    if(meeting_status_id != null && meeting_status_id.isNotEmpty ) query['meeting_status_id'] = meeting_status_id.toString();
    if(role != null && role.isNotEmpty ) query['role'] = role.toString();

    try{
      Map<String, String> headers = {
        "Content-type": "application/json",
        'token': token,
        'x-ijtimaati-using':"ios",
        'x-ijtimaati-version':"4",
        'x-isweb':'false'};

      String queryString = Uri(queryParameters:query).query.isNotEmpty?"&"+Uri(queryParameters:query).query:"";

      // print("urlHere>>"+baseUrl + Constants.MEETINGS+'?date='+date+"&page="+page.toString()+queryString.toString());
      response = await http.get(Uri.parse(baseUrl + Constants.MEETINGS+'?date='+date+"&page="+page.toString()+queryString),
          headers: headers
      );
    }catch (e){
    }
    // return response==null?[]: await myModels;
    return response==null?[]: response.body;
  }

  Future<List<AllMeetingsResponse>> getAllMeetings(String baseUrl ,String token) async {
    var response ;
    List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+baseUrl + Constants.MEETINGS);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(baseUrl + Constants.MEETINGS),headers: headers);
      print("ResponsIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AllStatusResponse>> getAllStatus(String baseUrl ,String token) async {
    var response ;
    List<AllStatusResponse> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(baseUrl + Constants.STATUS),headers: headers);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AllStatusResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<String> getAllCommittes(String baseUrl ,String token) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.COMMITTEES);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    // dynamic x = something();
    // return response==null?null:CommitteeResponseModel.fromJson(response);
   String data = json.encode(response);
    // print("data>>>>"+data.toString());
    return response==null?null:data;
  }

  Future<AddMeetingResponseModel> addMeeting(String baseUrl,String token,AddMeetingRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.ADD_MEETINGS,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AddMeetingResponseModel.fromJson(response);
  }

  // Future<MeetingDetailsResponseModel> getMeetingDetails(String baseUrl ,String token,int id) async {
  Future<String> getMeetingDetails(String baseUrl ,String token,int id) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+baseUrl + Constants.MEETINGS_DETAILS+id.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(baseUrl,token,Constants.MEETINGS_DETAILS+id.toString());
      // print("ResponsISss>>"+response);

      // myModels = (json.decode(response.body) as List).map((i) =>
      //     AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?null:MeetingDetailsResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
  }

  Future<int> uploadImage (String baseUrl ,MultipartFile logoFile,int meeting_id,int library_id,String token) async {

    // http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(BASE_URL+UPDATE_FILE+"/"+id.toString()));
    print("RemoteUrlIs>>"+baseUrl+Constants.UPDATE_FILE);
    print("meeting_id>>"+meeting_id.toString());
    print("library_id>>"+library_id.toString());

    http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(baseUrl+Constants.UPDATE_FILE));
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
    });
    return res.statusCode;
  }

  Future<AddNoteResponseModel> addNote(String baseUrl,String token,int id,AddNoteRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.MEETINGS_DETAILS+id.toString()+Constants.NOTE,jsonUser,token);
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


  // Future<DecisonResponseModel> getDescisionData(String baseUrl,String token,int meetingId,int decisionId) async {
  Future<String> getDescisionData(String baseUrl,String token,int meetingId,int decisionId) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    print("UrlIs>>"+baseUrl + Constants.MEETINGS_DETAILS+meetingId.toString()+Constants.DECISIONS+decisionId.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(baseUrl,token,Constants.MEETINGS_DETAILS+meetingId.toString()+Constants.DECISIONS+decisionId.toString());
      // print("ResponsISss>>"+response);

      // myModels = (json.decode(response.body) as List).map((i) =>
      //     AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?null:DecisonResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
  }

  Future<List<AddCommentResponseModel>> addComment(String baseUrl,String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("usl>>"+baseUrl + "decisions/"+id.toString()+Constants.COMMENT);
      response = await http.post(Uri.parse(baseUrl + "decisions/"+id.toString()+Constants.COMMENT),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AddCommentResponseModel>> addMultipleDecisionsComments(String baseUrl,String token ,int id,List<AddCommentRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      print("usl>>"+id.toString());
      print("usl>>"+token);
      print("usl>>"+baseUrl + "decisions/"+id.toString()+Constants.MultipleDecisionsComments);
      response = await http.post(Uri.parse(baseUrl + "decisions/"+id.toString()+Constants.MultipleDecisionsComments),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AddCommentResponseModel>> addMultipleACtionsComments(String baseUrl,String token ,int id,List<AddCommentRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      print("usl>>"+id.toString());
      print("usl>>"+baseUrl + "actions/"+id.toString()+Constants.MultipleDecisionsComments);
      response = await http.post(Uri.parse(baseUrl + "actions/"+id.toString()+Constants.MultipleDecisionsComments),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<List<AddCommentResponseModel>> addMultipleTalkingPointComments(String baseUrl,String token ,int id,List<AddCommentRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      print("usl>>"+id.toString());
      print("usl>>"+baseUrl + "talkingpoints/"+id.toString()+Constants.MultipleDecisionsComments);
      response = await http.post(Uri.parse(baseUrl + "talkingpoints/"+id.toString()+Constants.MultipleDecisionsComments),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<ChangeVoteResponseModel> changeVote(String baseUrl,String token,int id,ChangeVoteRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,"decisions/"+id.toString()+Constants.CHANGE_VOTE,jsonUser,token);
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

  Future<ChangeStatusResponseModel> changeActionStatus(String baseUrl,String token,int id,ChangeActionStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,"actions/"+id.toString()+Constants.CHANGE_STATUS,jsonUser,token);
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

  Future<ChangeStatusMeetingResponseModel> changeMeetingStatus(String baseUrl,String token,int id,ChangeMeetingStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.MEETINGS_DETAILS+id.toString()+Constants.CHANGE_MEETING_STATUS,jsonUser,token);
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


  // Future<ActionsResponseModel> getActionData(String baseUrl,String token,int meetingId,int decisionId) async {
  Future<String> getActionData(String baseUrl,String token,int meetingId,int decisionId) async {
    var response ;
    print("UrlIs>>"+baseUrl + Constants.ACTIONS+meetingId.toString()+Constants.DECISIONS+decisionId.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.getWithToken(baseUrl,token,Constants.MEETINGS_DETAILS+meetingId.toString()+Constants.ACTIONS+decisionId.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?null:ActionsResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
  }
  // Future<TalkingPointsResponseModel> getTalikingPointsData(String baseUrl,String token,int meetingId,int decisionId) async {
  Future<String> getTalikingPointsData(String baseUrl,String token,int meetingId,int decisionId) async {
    var response ;
    // print("UrlIs>>"+baseUrl + Constants.ACTIONS+meetingId.toString()+Constants.DECISIONS+decisionId.toString());
    try{
      // Map<String, String> headers = {"Content-type": "application/json",
      //   'token': token};
      response = await DioHelper.getWithToken(baseUrl,token,Constants.MEETINGS_DETAILS+meetingId.toString()+Constants.TALIKIN_POINTS+decisionId.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?null:TalkingPointsResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
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

  Future<List<ActionsCommentResponseModel>> addCommentForAction(String baseUrl,String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<ActionsCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("UrlIs>>"+baseUrl + "actions/"+id.toString()+Constants.COMMENT);
      response = await http.post(Uri.parse(baseUrl + "actions/"+id.toString()+Constants.COMMENT),headers: headers,body: jsonUser);
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


  Future<List<AddCommentResponseModel>> addCommentTalkingPoint(String baseUrl,String token ,int id,AddCommentRequestModel model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      print("usl>>"+baseUrl + "talkingpoints/"+id.toString()+Constants.COMMENT);
      response = await http.post(Uri.parse(baseUrl + "talkingpoints/"+id.toString()+Constants.COMMENT),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<DeleteCommentResponse> deleteComment(String baseUrl,int id,String token) async {
    var response ;
    print("UrlIs>>"+baseUrl + Constants.DELETE_COMMENT+id.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.deleteWithToken(baseUrl,Constants.DELETE_COMMENT+"/"+id.toString(),token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DeleteCommentResponse.fromJson(response);
  }

  Future<DeleteCommentResponse> deleteMultipleComment(String baseUrl,String token,List<DeleteCommentsRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    print("UrlIs>>"+baseUrl + Constants.DeleteMultipleComments);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.postWithToken(baseUrl,Constants.DeleteMultipleComments,jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DeleteCommentResponse.fromJson(response);
  }

  Future<SignatureResponseModel> postSignature(String baseUrl,String token,int id,SignatureRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    // print("UrlIs>>"+baseUrl + Constants.postSignature);
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.postSignature+id.toString()+"/approve",jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:SignatureResponseModel.fromJson(response);
  }

  Future<SignatureResponseModel> rejectSignature(String baseUrl,String token,int id,SignatureRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    // print("UrlIs>>"+baseUrl + Constants.postSignature);
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.postSignature+id.toString()+"/reject",jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:SignatureResponseModel.fromJson(response);
  }

}

