import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../exception/app_exception.dart';
import 'base_api_services.dart';
// import 'package:v15/data/exception/app_exception.dart';
// import 'package:v15/data/network/base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      // Optional: handle status code and return response body
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request Timed Out');
    }

    return jsonResponse;
  }

  @override
  Future postApi(String url, data) async {
    dynamic jsonResponse;
    if(kDebugMode){
      print(url);
      print(data);
    }
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      // Optional: handle status code and return response body
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request Timed Out');
    }

    return jsonResponse;
  }

  @override
  Future deleteApi(String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      // Optional: handle status code and return response body
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request Timed Out');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    if(kDebugMode){
      print(response.toString());
    }
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(
          'Error communication with server' + response.statusCode.toString(),
        );
      default:
        throw FetchDataException(
          'Error occurred while communicating with server',
        );
    }
  }
}
