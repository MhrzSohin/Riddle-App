import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'http_config.dart';

class Api {
  final dio = createDio();
  String _token = "";
  String _apiKey = HttpConfig.apiKey;

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: HttpConfig.baseUrl, //For example : https:www.example.com
      connectTimeout: const Duration(seconds: 10),
      //30 secs
      receiveTimeout: const Duration(seconds: 10),
      //30 secs
      sendTimeout: const Duration(seconds: 10),
      //20secs
    ));
    dio.interceptors.addAll({ErrorInterceptor()});
    dio.interceptors.add(HeaderInterceptor());
    dio.interceptors.addAll({
      LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          error: true,
          logPrint: (v) {
            log(v.toString());
          })
    });
    return dio;
  }

  String get token => _token;

  set token(String? value) {
    if (value != null && value.isNotEmpty) {
      _token = value;
    }
  }

  String get apiKey => _apiKey;

  set apiKey(String? value) {
    if (value != null && value.isNotEmpty) {
      _apiKey = value;
    }
  }

  void clearToken() {
    _token = "";
  }

  void clearApiKey() {
    _apiKey = "";
  }

  ///[GET] We will use this method in order to process get requests
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
    bool addAuthInterceptor = false,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    // print("QUERY PARAMS=>${queryParameters}");
    return await dio.get((baseUrl ?? dio.options.baseUrl) + path,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters);
  }

  ///[POST] We will use this method in order to process post requests
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
    bool addAuthInterceptor = false,
  }) async {
    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return await dio.post((baseUrl ?? dio.options.baseUrl) + path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  ///[PATCH] We will use this method in order to process post requests
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
    bool addAuthInterceptor = false,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return await dio.patch((baseUrl ?? dio.options.baseUrl) + path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  ///[PUT] We will use this method in order to process post requests
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
    bool addAuthInterceptor = false,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return await dio.put(
      (baseUrl ?? dio.options.baseUrl) + path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  ///[DELETE] We will use this method in order to process post requests
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
    bool addAuthInterceptor = false,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return await dio.delete(
      (baseUrl ?? dio.options.baseUrl) + path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  ///[Download] We will use this method in order to process download requests
  Future<Response> download(
    String path,
    String savePath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    bool addRequestInterceptor = false,
    bool addAuthInterceptor = false,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(RequestInterceptor(apiKey: apiKey));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    if (addAuthInterceptor) {
      dio.interceptors.add(AuthInterceptor(authToken: _token));
    }
    return await dio.download((baseUrl ?? dio.options.baseUrl) + path, savePath,
        onReceiveProgress: null,
        cancelToken: cancelToken,
        options: options,
        data: data,
        queryParameters: queryParameters);
  }
}

class ErrorResponse {
  final String message;
  final int statusCode;

  const ErrorResponse({
    required this.message,
    this.statusCode = 500,
  });

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      message: map['message'] ?? 'Something went wrong',
      statusCode: map['status_code'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'status_code': statusCode,
    };
  }
}

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  // final Dio dio;

  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ErrorResponse response;
    try {
      response = ErrorResponse.fromMap((err.response?.data ??
          {'message': "Something went wrong"}) as Map<String, dynamic>);
    } catch (_) {
      response = const ErrorResponse(message: 'Something went wrong');
    }

    switch (err.type) {
      case DioExceptionType.badResponse:
        {
          switch (err.response?.statusCode) {
            case 401:
              {
                if (err.requestOptions.path.contains('token/refresh')) {
                  throw TokenExpiredException(
                      errorResponse: response,
                      requestOptions: err.requestOptions);
                }

                throw UnAuthorizedException(
                    errorResponse: response,
                    requestOptions: err.requestOptions);
              }

            default:
              throw DioErrorException(
                  errorResponse: response, requestOptions: err.requestOptions);
          }
        }
      default:
        throw DioErrorException(
            errorResponse: response, requestOptions: err.requestOptions);
    }
  }
}

class RequestInterceptor extends Interceptor {
  final String apiKey;

  RequestInterceptor({required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = apiKey;
    return handler.next(options);
  }
}

class AuthInterceptor extends Interceptor {
  // final Dio dio;
  // final String apiKey;
  String? authToken;

  AuthInterceptor({
    this.authToken,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // GetStorage box = GetStorage();
    // var token =box.read(SConstKeys.accessToken);
    // log(token);
    // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkFtYXRoZXJtYW4iLCJpYXQiOjE2MjU0MjgxMjQsImV4pCI6MTYyNTUyNDcyNH0.XbUONNYu5X_yfo-ZZM_xWtPiuFrU932GcCqiX28L05s";
    options.headers['Authorization'] = 'Bearer $authToken';
    return handler.next(options);
  }
}

class DioErrorException extends DioException {
  final ErrorResponse errorResponse;

  @override
  String toString() => errorResponse.message;

  DioErrorException(
      {required this.errorResponse, required super.requestOptions});
}

class UnAuthorizedException extends DioException {
  final ErrorResponse errorResponse;

  @override
  String toString() => errorResponse.message;

  UnAuthorizedException(
      {required this.errorResponse, required super.requestOptions});
}

class TokenExpiredException extends DioException {
  final ErrorResponse errorResponse;

  @override
  String toString() => errorResponse.message;

  TokenExpiredException(
      {required this.errorResponse, required super.requestOptions});
}
