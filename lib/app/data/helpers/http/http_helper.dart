import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'http_method.dart';

part 'http_helper.freezed.dart';

class HttpHelper {
  final Dio _dio;

  HttpHelper({required Dio dio}) : _dio = dio;

  Future<RequestResult<T>> request<T>(
    String pathOrUrl, {
    HttpMethod method = HttpMethod.GET,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic> headers = const {},
    String? bearerToken,
    dynamic data,
    T Function(dynamic responseData)? parser,
    int retry = 1,
    int attempts = 0,
  }) async {
    try {
      final finalHeaders = {
        ...headers,
        if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
      };

      final response = await _dio.request(
        pathOrUrl,
        options: Options(
          method: method.name,
          headers: finalHeaders,
        ),
        queryParameters: queryParameters,
        data: data,
      );

      return RequestResult.success(
        statusCode: response.statusCode!,
        data: parser != null
            ? parser(response.data)
            : json.encode(response.data) as T,
      );
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        return RequestResult.timeOut(stackTrace: s);
      }

      if (e.type == DioExceptionType.badResponse && e.response != null) {
        if (attempts + 1 < retry) {
          return request<T>(
            pathOrUrl,
            method: method,
            queryParameters: queryParameters,
            headers: headers,
            bearerToken: bearerToken,
            data: data,
            parser: parser,
            retry: retry,
            attempts: attempts + 1,
          );
        }
        return RequestResult.unhandledError(
          exception: e.response!.statusCode!,
          stackTrace: s,
        );
      }

      return RequestResult.networkError(stackTrace: s);
    } catch (e, s) {
      return RequestResult.unhandledError(
        exception: e,
        stackTrace: s,
      );
    }
  }
}

@freezed
class RequestResult<T> with _$RequestResult<T> {
  const factory RequestResult.success({
    required int statusCode,
    required T data,
  }) = _Success<T>;

  const factory RequestResult.networkError({
    required StackTrace stackTrace,
  }) = _NetworkError<T>;

  const factory RequestResult.internetConnection() = _InternetConnection<T>;

  const factory RequestResult.timeOut({
    required StackTrace stackTrace,
  }) = _TimeOut<T>;

  const factory RequestResult.unhandledError({
    required Object exception,
    required StackTrace stackTrace,
  }) = _UnhandledException<T>;
}
