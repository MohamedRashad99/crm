import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:laravel_exception/laravel_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class NetWork {

  static Dio get _dio {
    final _dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.elmanhg.com/wp-json/wp/v2',
        contentType: 'application/json',
        headers: {
          'accept': 'application/json',
        },
        validateStatus: (_) => true,
        followRedirects: false,
      ),
    );
    // if (kDebugMode) {
    //   _dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
    // }
    return _dio;
  }
  Response _validate(Response res) {
    if (res.statusCode == 500) {
      throw LServerException.parse(res.data!);
    }
    else if (res.statusCode == 404) {
      throw LNotFoundException.parse(res.data!);
    }
    else if (res.statusCode == 422) {
      throw LValidationException(res.data!);
    }
    else if (res.data == null) {
      throw 'api returend null repsonse';
    }
    else if (res.statusCode == 403) {
      throw res.data['errors']['phone'][0];
    }
    return res;
  }


  static Future<Response> get(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParams,
      }) async {
    return await _dio.get(
      '/$url',
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> post(
      String url, {
        dynamic body,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParams,
      }) async {
    return await _dio.post(
      '/$url',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }




}