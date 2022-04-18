// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

typedef CompletionHandler = void Function(Response? response, DioError? error);

class Api {
  static late var dio = Dio(BaseOptions(
    baseUrl: "http://httpbin.org/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      "user-agent": "dio",
    },
  ));

  Api.post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    CompletionHandler? completion,
  }) {
    Api.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: checkOptions('post', options),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      completion: completion,
    );
  }

  Api.get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    CompletionHandler? completion,
  }) {
    Api.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: checkOptions('GET', options),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      completion: completion,
    );
  }

  Api.request(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CompletionHandler? completion,
  }) {
    dio
        .request(path,
            data: data,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((response) => completion?.call(response, null))
        .catchError((error) => completion?.call(null, error));
  }

  static Options checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}
