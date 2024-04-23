import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Dio dioClient = Dio();

void initializeClient() async {
  dioClient.interceptors.clear();

  dioClient.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 90,
  ));

  dioClient.interceptors.add(
    InterceptorsWrapper(
      onResponse: (e, handler) {},
      onError: (e, handler) {
        if (e.response!.statusCode == HttpStatus.forbidden) {
          _retry();
        }
      },
      onRequest: (options, handler) {},
    ),
  );
}

void _retry() {}
