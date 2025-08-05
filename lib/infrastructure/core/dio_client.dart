import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'package:logging/logging.dart';
import 'package:tournamentapp/infrastructure/core/constants.dart';

@lazySingleton
class DioClient {
  GlobalKey<NavigatorState>? _aliceNavigatorKey;
  static final _log = Logger('DIO: ');
  final _dio = Dio(BaseOptions(
    followRedirects: false,
    connectTimeout: 60000,
    receiveTimeout: 60000,
    sendTimeout: 60000,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));
  final _vanillaDio = Dio();
  // AliceDioInterceptor? aliceInterceptor;
  String _baseUrl = API_PROD_BASE_URL;
  String _accessToken = "";

  DioClient() {
    print('interceptors length ${_dio.interceptors.length}');
    _setupDio(_accessToken, null);
  }

  void setToken({required String token, required String username}) async {
    _accessToken = token;
    _setupDio(_accessToken, username);
  }

  void setBaseUrl({required String baseUrl}) {
    _baseUrl = baseUrl;
    _log.fine("Dio:  baseurl is $_baseUrl");
  }

  String get baseUrl => _baseUrl;

  void setUsername(String username) {}

  void _setupDio(String _token, String? username) {
    print('base url is $_baseUrl');
    _dio.interceptors.clear();

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // Only add Authorization header if token is not empty
      if (_token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer " + _token;
      }

      // Log request details
      _log.info('Request: ${options.method} ${options.path}');
      _log.info('Headers: ${options.headers}');
      _log.info('Data: ${options.data}');

      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      _log.info(
          'Response: ${response.statusCode} ${response.requestOptions.path}');
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) {
      _log.severe(
          'Error: ${error.response?.statusCode} ${error.requestOptions.path}');
      _log.severe('Error message: ${error.message}');
      if (error.response?.data != null) {
        _log.severe('Error data: ${error.response?.data}');
      }
      return handler.next(error);
    }));

    // _alice.showInspector();
  }

  Future<void> refreshToken() async {}

  GlobalKey<NavigatorState>? setAliceNavigatorKey(key) {
    _aliceNavigatorKey = key;
  }

  Future httpPost(
      {required String path, data, CancelToken? cancelToken}) async {
    _log.info('http: $path');

    // Determine content type based on data type
    Options? options;
    if (data is FormData) {
      options = Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      );
    } else if (data is String) {
      options = Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
    }
    // For Map/JSON data, use default application/json from base options

    return _dio.post(_baseUrl + path,
        data: data, cancelToken: cancelToken, options: options);
  }

  Future httpPut({required String path, data, CancelToken? cancelToken}) async {
    _log.info('http: $path');

    // Determine content type based on data type
    Options? options;
    if (data is FormData) {
      options = Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      );
    } else if (data is String) {
      options = Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
    }

    return _dio.put(_baseUrl + path,
        data: data, cancelToken: cancelToken, options: options);
  }

  Future httpDelete(
      {required String path, data, CancelToken? cancelToken}) async {
    _log.info('http: $path');
    return _dio.delete(_baseUrl + path, data: data, cancelToken: cancelToken);
  }

  Future httpGet({required String path, CancelToken? cancelToken}) async {
    _log.info('http: $path');
    return _dio.get(_baseUrl + path, cancelToken: cancelToken);
  }

  Future httpGetPlain({required String url, CancelToken? cancelToken}) async {
    return _vanillaDio.get(url, cancelToken: cancelToken);
  }

  Future httpPostPlain(
      {required String path, data, CancelToken? cancelToken}) async {
    _log.info('http: $path');
    return _vanillaDio.post(path, data: data, cancelToken: cancelToken);
  }

  Future httpPutPlain(
      {required String path,
      data,
      Options? options,
      CancelToken? cancelToken}) async {
    _log.info('http: $path');
    return _vanillaDio.put(path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future httpWithRetries({
    required String method,
    required String path,
    required int repeat,
    required Duration timeout,
    bool? useBase,
    dynamic data,
    Function? onTimeout,
  }) async {
    method = method.toUpperCase();
    int trialIndex = 1;
    final bool useBaseUrl = useBase ?? true;
    late var response;

    await Future.doWhile(() async {
      CancelToken _cancelToken = CancelToken();

      // Handle different data types
      dynamic requestData;
      if (data != null) {
        if (data is FormData) {
          final FormData freshFormData = FormData();
          freshFormData.fields.addAll(data.fields);
          // Also copy files if they exist
          if (data.files.isNotEmpty) {
            freshFormData.files.addAll(data.files);
          }
          requestData = freshFormData;
        } else {
          requestData = data; // For JSON, String, or other types
        }
      }

      var apiMethod;
      switch (method) {
        case 'GET':
          apiMethod = useBaseUrl
              ? httpGet(path: path, cancelToken: _cancelToken)
              : httpGetPlain(url: path, cancelToken: _cancelToken);
          break;
        case 'POST':
          apiMethod = useBaseUrl
              ? httpPost(
                  path: path, cancelToken: _cancelToken, data: requestData)
              : httpPostPlain(
                  path: path, cancelToken: _cancelToken, data: requestData);
          break;
        case 'PUT':
          apiMethod = useBaseUrl
              ? httpPut(
                  path: path, cancelToken: _cancelToken, data: requestData)
              : httpPutPlain(
                  path: path, cancelToken: _cancelToken, data: requestData);
          break;
        case 'DELETE':
          apiMethod = httpDelete(
              path: path, cancelToken: _cancelToken, data: requestData);
          break;
        default:
          response = Exception('Invalid method');
          return false;
      }

      try {
        await apiMethod.then((res) {
          print('http responded');
          response = res;
        }).timeout(timeout, onTimeout: () {
          print('timedout $path on try $trialIndex ');
          _cancelToken.cancel();
          response = Exception('API_TIMEOUT');
        });
      } catch (e) {
        print('Exception caught: $e');
        if (e is DioError) {
          print('DioError details: ${e.response?.statusCode} - ${e.message}');
          print('DioError response data: ${e.response?.data}');

          if (e.response?.statusCode == 401) {
            await refreshToken();
          }

          // Don't retry on certain status codes
          if (e.response?.statusCode != null) {
            final statusCode = e.response!.statusCode!;
            if (statusCode == 400 || statusCode == 404 || statusCode == 415) {
              // These are client errors that won't be fixed by retrying
              response = Exception('HTTP $statusCode: ${e.response?.data}');
              return false;
            }
          }
        }

        print('handle this exception ');
        response = Exception(e.toString());
        return Future.value(false);
      }

      trialIndex++;
      if (response is Exception && trialIndex <= repeat) {
        print('Retrying... attempt $trialIndex of $repeat');
        return Future.value(true);
      } else {
        return false;
      }
    });

    print('returning response from post with retry');
    return response;
  }
}
