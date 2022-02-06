import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'AppException.dart';

class DioHelper {

  static Future<dynamic> getForOrganization(String domain) async {
    print('Api Get, url $domain');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(URL_ORGANIZATION1+domain+URL_ORGANIZATION2));
      print("My UrlIs>>"+URL_ORGANIZATION1+domain+URL_ORGANIZATION2);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

 static Future<dynamic> getWithToken(String token ,String url) async {
    print('Api Get, url $url');

    var responseJson;
    try {
      print("TokenIS>>>"+token);
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      final response = await http.get(Uri.parse(BASE_URL + url),headers: headers);
      print("My Url");
      print(BASE_URL + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!'+responseJson.toString());
    return responseJson;
  }

  static Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(BASE_URL + url));
      print("My Url");
      print(BASE_URL + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  static Future<dynamic> postWithToken(String url, dynamic body,String token) async {
    // print('Api Post, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json",'token': token};
      print("UrlNOwIs>>"+BASE_URL + url);
      print(body);
      final response = await http.post(Uri.parse(BASE_URL + url),headers: headers, body: body);
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

 static Future<dynamic> post(String url, dynamic body) async {
    // print('Api Post, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json",};
      print("UrlNOwIs>>"+BASE_URL + url);
      print(body);
      final response = await http.post(Uri.parse(BASE_URL + url),headers: headers, body: body);
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

 static Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(BASE_URL + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

 static Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(BASE_URL + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
  static Future<dynamic> deleteWithToken(String url,String token) async {
    Map<String, String> headers = {"Content-type": "application/json",'token': token};
    print("UrlNOwIs>>"+BASE_URL + url);
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(BASE_URL + url),headers: headers);
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