import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'app_exception.dart';
import 'base_service.dart';

class ApiService extends BaseService {
  late Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // "Authorization": "Bearer $token"
      },
      receiveTimeout: 60000,
      connectTimeout: 60000,
    );

    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;

    Response response;

    try {
      response = await _dio.get(url);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostResponse(String url, data) async {
    dynamic responseJson;

    Response response;

    try {
      response = await _dio.post(url, data: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
