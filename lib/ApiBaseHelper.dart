import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Utils/Constants.dart';
import 'network/remote/AppException.dart';

class ApiBaseHelper {


  Future<dynamic> getWithToken(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json",
        'token': 'de37abd34d77843c28ae7e1ed7b7c2b6'};
      final response = await http.get(Uri.parse(Constants.BASE_URL + url + url),headers: headers);
      print("My Url");
      print(Constants.BASE_URL + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(Constants.BASE_URL + url));
      print("My Url");
      print(Constants.BASE_URL + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    // print('Api Post, url $url');
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      print("UrlNOwIs>>"+Constants.BASE_URL + url);
      print(body);
      final response = await http.post(Uri.parse(Constants.BASE_URL + url),headers: headers, body: body);
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

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(Constants.BASE_URL + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(Constants.BASE_URL + url));
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
