import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/network/end_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'AppException.dart';

class DioHelper {

  static Future<dynamic> getForOrganization(String domain) async {
    // print('Api Get, url $domain');
    // print('Api Get, url>>'+Constants.URL_ORGANIZATION1+domain+Constants.URL_ORGANIZATION2);
    var responseJson;
    try {
      // final response = await http.get(Uri.parse(Constants.URL_ORGANIZATION1+domain+Constants.URL_ORGANIZATION2));
      // print("My UrlIs>>"+Constants.URL_ORGANIZATION1+domain+Constants.URL_ORGANIZATION2);
      // responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

 static Future<dynamic> getWithToken(String baseUrl, String token ,String url) async {
    print('Api Get, url $url');

    var responseJson;
    try {
      print("TokenIS>>>"+token);
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      final response = await http.get(Uri.parse(baseUrl + url),headers: headers);
      print("My Url");
      print(baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!'+responseJson.toString());
    return responseJson;
  }

  static Future<dynamic> get(String baseUrl ,String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      print("My Url");
      print(baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  static Future<dynamic> postWithToken(String baseUrl ,String url, dynamic body,String token) async {
    // print('Api Post, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json",'token': token};
      print("UrlNOwIs>>"+baseUrl + url);
      print(body);
      final response = await http.post(Uri.parse(baseUrl + url),headers: headers, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      responseJson="No net";
      throw FetchDataException('No Internet connection');
      // return responseJson;
    }
    print('api post.');
    return responseJson;
  }

 static Future<dynamic> post(String baseUrl,String url, dynamic body) async {
    // print('Api Post, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json",};
      print("UrlNOwIsssssssss>>"+baseUrl + url);
      print(body);
      final response = await http.post(Uri.parse(baseUrl + url),headers: headers, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      responseJson="No net";
      throw FetchDataException('No Internet connection');
      // return responseJson;
    }
    print('api post.');
    return responseJson;
  }

 static Future<dynamic> put(String baseUrl,String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

 // static Future<dynamic> delete(String url) async {
 //    print('Api delete, url $url');
 //    var apiResponse;
 //    try {
 //      final response = await http.delete(Uri.parse(Constants.BASE_URL + url));
 //      apiResponse = _returnResponse(response);
 //    } on SocketException {
 //      print('No net');
 //      throw FetchDataException('No Internet connection');
 //    }
 //    print('api delete.');
 //    return apiResponse;
 //  }
  static Future<dynamic> deleteWithToken(String baseUrl,String url,String token) async {
    Map<String, String> headers = {"Content-type": "application/json",'token': token};
    print("UrlNOwIs>>"+baseUrl + url);
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(baseUrl + url),headers: headers);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}