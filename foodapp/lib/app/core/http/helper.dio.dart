import 'package:dio/dio.dart';

import 'token_interceptor.dio.dart';

class HttpResponse<T> {
  HttpResponse({
    this.body,
    this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T? body;
  Headers? headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;

  static HttpResponse map(Response response) {
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}

class HttpHelper {
  static final _options = BaseOptions(
    baseUrl: "http://192.168.1.7:3000/api/",
    connectTimeout: 1000,
    receiveTimeout: 1000,
  );
  static final Dio _dio = Dio(_options);

  static Dio getDio() {
    _dio.interceptors
      ..clear()
      ..add(TokenInterceptor(_dio));
    return _dio;
  }

  static FormData mapToFormData(Map<String, dynamic> map) {
    final formData = FormData.fromMap(map);
    final FormData newData = FormData();

    for (var element in formData.fields) {
      newData.fields.add(MapEntry(element.key, element.value));
    }

    for (var element in formData.files) {
      if (element.key.contains('[') || element.key.contains(']')) {
        final newKey =
            element.key.replaceAllMapped(RegExp('([+[a-zA-Z]+])'), (m) {
          return '${m[0]}'.replaceAll('[', '.').replaceAll(']', '');
        });
        final newValue = element.value;
        final newEntry = MapEntry(newKey, newValue);
        newData.files.add(newEntry);
      } else {
        newData.files.add(element);
      }
    }

    return newData;
  }

  static Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    final Response response = await getDio().get(url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        cancelToken: CancelToken());
    return HttpResponse.map(response);
  }

  static Future<HttpResponse> post(
    String url, {
    data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Function(int count, int total)? onSendProgress,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    if (formData != null) {
      data = HttpHelper.mapToFormData(formData);
    }
    final Response response = await getDio().post(
      url,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );

    return HttpResponse.map(response);
  }

  static Future<HttpResponse> put(
    String url, {
    data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Function(int count, int total)? onSendProgress,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    if (formData != null) {
      data = HttpHelper.mapToFormData(formData);
    }
    final Response response = await getDio().put(
      url,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );

    return HttpResponse.map(response);
  }

  static Future<HttpResponse> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await getDio().delete(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return HttpResponse.map(response);
  }
}
