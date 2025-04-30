import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer' as developer;

const _titleSeparator = '══════════════════════════════════════════════════';
const _encoder = JsonEncoder.withIndent('  ');

mixin _LogMixin {
  void printRequest(Object? value, [String prefix = '']) =>
      _print(value, prefix);

  void printError(Object? value, [String prefix = '']) => _print(value, prefix);

  void printResponse(Object? value, [String prefix = '']) =>
      _print(value, prefix);

  void _print(Object? object, String prefix) {
    String content;
    if (object is Map || object is List) {
      content = _encoder.convert(object);
    } else {
      content = object.toString();
    }
    if (prefix.isNotEmpty) content = '$prefix: $content';
    developer.log(content);
  }
}

class LoggingInterceptor extends InterceptorsWrapper with _LogMixin {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printRequest('$_titleSeparator Request Options $_titleSeparator');
    printRequest('[${options.method.toUpperCase()}] ${options.uri}');
    if (options.queryParameters.isNotEmpty) {
      printRequest(options.queryParameters, 'QueryParameters');
    }
    printRequest(options.headers, 'Headers');
    if (options.data is Map || options.data is Iterable) {
      printRequest(options.data, 'Data');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printResponse('$_titleSeparator Response $_titleSeparator');
    printResponse(
      '[${response.requestOptions.method.toUpperCase()}] [${response.statusCode}] ${response.requestOptions.uri}',
    );
    if (response.data is Map || response.data is List) {
      printResponse(response.data, 'Data');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    printError('$_titleSeparator DioError $_titleSeparator');
    printError(
      '[${err.requestOptions.method.toUpperCase()}] [${err.response?.statusCode}] ${err.requestOptions.uri}',
    );
    printError('[${err.type}] ${err.message}');
    if (err.response?.data is Map) printError(err.response?.data, 'Data');
    super.onError(err, handler);
  }
}
