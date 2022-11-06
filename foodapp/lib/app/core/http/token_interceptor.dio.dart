import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../modules/auth/presentation/controllers/auth.controller.dart';
import '../services/stores/box.storage.dart';
import '../values/app_keys.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;
  final AuthController _authController = AuthController.to;
  String? _accessToken;
  TokenInterceptor(this.dio);

  Stopwatch stopwatch = Stopwatch();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    stopwatch.reset();
    String method = options.method.toUpperCase();

    debugPrint("--[HTTP $method]--: ${options.uri}");
    await _checkTokenExpired();
    _accessToken = await KeyStorage.readString(key: KeyKey.token);
    options.headers.addAll({
      HttpHeaders.authorizationHeader: "${AppKeys.TOKEN_TYPE} $_accessToken",
      'platform': 'mobile',
    });
    stopwatch.start();
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String method = err.requestOptions.method.toUpperCase();
    int? statusCode = err.response?.statusCode;
    Uri? url = err.response?.realUri;

    debugPrint("""-- [HTTP $method/$statusCode ERROR """
        """(${stopwatch.elapsed} ms)]--: $url""");
    stopwatch.stop();
    //Assume 401 stands for token expired
    if (statusCode == 401) {
      _authController.logout();
      return;
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String method = response.requestOptions.method.toUpperCase();

    debugPrint("""-- [HTTP $method/${response.statusCode} DONE """
        """(${stopwatch.elapsed} ms)]--: ${response.realUri}""");
    stopwatch.stop();

    return handler.next(response);
  }

  Future<void> _checkTokenExpired() async {
    // String expiredTimeString =
    //     storage.read(AppKeys.ACCESS_TOKEN_EXPIRED_TIME) ?? '';
    // if (expiredTimeString.isNotEmpty &&
    //     DateTime.parse(expiredTimeString)
    //         .isBefore(DateTime.now().add(const Duration(seconds: 3)))) {
    //   String refreshToken = storage.read(AppKeys.REFRESH_TOKEN) ?? '';
    //   if (refreshToken.isEmpty) {
    //     _authController.navigateToLogin();
    //     return;
    //   }
    // debugPrint("--[REFRESH TOKEN]--: $refreshToken");
    // await _dio
    //     .get('${EndPoints.REFRESH_TOKEN}/$refreshToken')
    //     .then((response) async {
    //   // final tokens = RefreshTokenEntity.fromJson(response.data);
    //   // _accessToken = tokens.accessToken;
    //   //
    //   // await _authController.setTokens(
    //   //   accessToken: tokens.accessToken,
    //   //   refreshToken: tokens.refreshToken,
    //   //   expiredDuration: tokens.expiresIn,
    //   // );
    // }).onError((error, stackTrace) {
    //   //  _dio.interceptors.
    //   //   _dio.interceptors.responseLock.unlock();
    //   //   _authController.logout();
    //   return;
    // });
    // _dio.unlock();
    // }
  }
}
