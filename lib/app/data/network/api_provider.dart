import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';

import '../local/shared_prefrences.dart';
import 'api_endpoints.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60)));

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future baseGetAPI(
    url,
    context, {
    payload,
    successMsg,
    loading,
    bool direct = false,
    bool authorization = true,
  }) async {
    try {
      Response response;
      String? token;
      Map<String, dynamic> data = {};
      if (payload != null) {
        for (String key in payload.keys) {
          data[key] = payload[key];
        }
      }
      if (authorization) {
        token = Get.find<SharedPrefrencesManager>()
            .getString(SharedPrefrencesManager.keyAccessToken);
        data['Authorization'] = token;
      }

      if (authorization && token != null) {
        debugPrint(APIEndpoint.baseUrl + url);
        response = await _client.get(APIEndpoint.baseUrl + url,
            data: data,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': token,
            }));
      } else {
        debugPrint(APIEndpoint.baseUrl + url);
        response = await _client.get(
          APIEndpoint.baseUrl + url,
          options: Options(
              headers: <String, String>{'Content-Type': 'application/json'}),
        );
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      return e.response?.data;
    }
  }

  Future basePostAPI({
    required String endPoint,
    body,
    bool authorization = true,
  }) async {
    String targetURL = APIEndpoint.baseUrl + endPoint;
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    if (authorization) {
      String? token = Get.find<SharedPrefrencesManager>()
          .getString(SharedPrefrencesManager.keyAccessToken);
      if (token != null) {
        body['Authorization'] = token;
        headers['Authorization'] = token;
      }
    }
    Response response;
    try {
      response = await _client.post(targetURL,
          data: body, options: Options(headers: headers));
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      return {"status": "fail"};
    } on DioException catch (e) {
      // debugPrint(e.response?.data.toString());
      Map<String, dynamic> status = {"status": "fail"};
      if (e.response != null) {
        status['message'] = e.response!.data.values;
      }

      return status;
    }
    return response.data;
  }

  Future basePostMultiPartAPI({
    required String endPoint,
    required Map<String, String> files,
    Map<String, dynamic>? body, // Use Map for the request body
    bool authorization = true,
  }) async {
    String targetURL = APIEndpoint.baseUrl + endPoint;
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'multipart/form-data';

    if (authorization) {
      String? token = Get.find<SharedPrefrencesManager>()
          .getString(SharedPrefrencesManager.keyAccessToken);
      if (token != null) {
        dio.options.headers['Authorization'] = token;
        body!['Authorization'] = token;
      }
    }

    FormData formData = FormData();
    // for (Map<String, String> file in files) {
    //   String fieldName = file.keys.first;
    //   String filePath = file.values.first;
    //   formData.files.add(
    //     MapEntry(
    //       fieldName,
    //       await MultipartFile.fromFile(
    //         filePath,
    //         contentType: MediaType('image', 'jpeg'),
    //       ),
    //     ),
    //   );
    // }

    for (int i = 0; i < files.length; i++) {
      String fieldName = files.keys.elementAt(i);
      String filePath = files.values.elementAt(i);
      formData.files.add(
        MapEntry(
          fieldName,
          await MultipartFile.fromFile(
            filePath,
            contentType: MediaType('image', 'jpeg'),
          ),
        ),
      );
    }

    // Add other fields from the body
    if (body != null) {
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
    }

    Response response;
    try {
      response = await dio.post(targetURL, data: formData);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on DioException catch (e) {
      Map<String, dynamic> status = {"status": "fail"};
      if (e.response != null) {
        status['message'] = e.response!.data.toString();
      }
      return status;
    } on Exception catch (e) {
      debugPrint('Error: ${e.toString()}');
      return {"status": "fail"};
    }

    return response.data;
  }

  Future baseMultiPartAPI(url, body, auth, context, dynamic file,
      {successMsg, loading, bool direct = false}) async {
    try {
      FormData? formData;
      _client.options.headers.addAll({"Authorization": "Bearertoken here"});
      Response response;
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
        )
      });
      response = await _client.post(
        APIEndpoint.baseUrl + url,
        data: formData,
      );

      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      debugPrint(e.response?.data);
      return e.response?.data;
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    debugPrint("exception");
    switch (response.statusCode) {
      case 200:
        debugPrint("200");
        // print(response.data);
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        debugPrint("default");
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  // String toString() {
  //   return "[$code]: $message \n $details";
  // }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
