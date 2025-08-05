import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'package:logging/logging.dart';
import 'package:tournamentapp/infrastructure/core/constants.dart';

@lazySingleton
class DioClients {
  GlobalKey<NavigatorState>? _aliceNavigatorKey;
  static final _log = Logger('DIO: ');
  final _dio = Dio(BaseOptions(
    followRedirects: false,
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
    if (username != null && username == "HAhmad") {
      setUsername(username);

      if (_aliceNavigatorKey != null) {}
    }

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.headers["Authorization"] = "Bearer " + _token;
      return handler.next(options);
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
    return _dio.post(_baseUrl + path, data: data, cancelToken: cancelToken);
  }

  Future httpPut({required String path, data, CancelToken? cancelToken}) async {
    _log.info('http: $path');
    return _dio.put(_baseUrl + path, data: data, cancelToken: cancelToken);
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
    dynamic data, // Changed from FormData? to dynamic
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
          requestData = freshFormData;
        } else {
          requestData = data; // For JSON or other types
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
        if (e is DioError) {
          if (e.response?.statusCode == 401) {
            await refreshToken();
          }
        }
        print('handle this exception ');
        response = Exception(e);
        return Future.value(false);
      }

      trialIndex++;
      if (response is Exception && trialIndex <= repeat)
        return Future.value(true);
      else
        return false;
    });

    print('returning response from post with retry');
    return response;
  }
}
