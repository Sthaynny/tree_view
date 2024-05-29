import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tree_view/shared/utils/formatters/query_formatter.dart';

class LoggingInterceptor implements Interceptor {
  LoggingInterceptor({this.showHeaders = false});
  final bool showHeaders;
  String _formatarJSON(dynamic data, String color) {
    final encoder = JsonEncoder.withIndent('$color  ');
    final jsonFormatado = encoder.convert(data);
    return jsonFormatado.replaceFirst(
      RegExp(r'(?<="video": \[)[^[]+(?=])'),
      '"Um monte de Bytes..."',
    );
  }

  String _getRequestUrl(RequestOptions options) {
    final queryParameters = QueryFormatter.formatQueryParameters(
      parameters: options.queryParameters,
    );
    return '${options.baseUrl}${options.path}$queryParameters';
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    debugPrint('$_redColorCode$_lineSeparator');
    debugPrint(
        '$_redColorCode$_groupSeparator Ops... Ocorreu um erro!!!$_groupSeparator');
    debugPrint('$_redColorCode<-- ERROR ${_getRequestUrl(err.requestOptions)}');
    if (showHeaders) {
      debugPrint('$_yellowColorCode$_groupSeparator Headers $_groupSeparator');
      err.response?.headers.forEach(
        (key, dynamic value) => debugPrint('$_redColorCode$key: $value'),
      );
      debugPrint(
          '$_yellowColorCode$_groupSeparator Fim Headers $_groupSeparator');
    }
    if (err.response != null) {
      debugPrint(_isTipoRespostaEmBytes(err.response!)
          ? _formatarBytes(err.response!.data)
          : _formatarJSON(err.response!.data, _redColorCode));
      debugPrint('$_redColorCode${err.error}');
    }
    debugPrint(
        '$_redColorCode<-- END ${err.requestOptions.method.toUpperCase()}');
    debugPrint('$_redColorCode$_lineSeparator');
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    debugPrint('$_yellowColorCode$_lineSeparator');
    debugPrint(
        '$_yellowColorCode$_groupSeparator [Request Api] $_groupSeparator');
    debugPrint(
      '$_yellowColorCode--> ${options.method.toUpperCase()} ${_getRequestUrl(options)}',
    );
    debugPrint(
        '$_yellowColorCode$_groupSeparator Fim Request $_groupSeparator');

    if (showHeaders) {
      debugPrint('$_yellowColorCode$_groupSeparator Headers $_groupSeparator');
      options.headers.forEach(
        (key, dynamic value) => debugPrint('$_yellowColorCode$key: $value'),
      );
      debugPrint(
          '$_yellowColorCode$_groupSeparator Fim Headers $_groupSeparator');
    }
    if (options.data != null) {
      debugPrint('$_yellowColorCode$_groupSeparator Body $_groupSeparator');
      debugPrint(_formatarJSON(options.data, _yellowColorCode));
      debugPrint('$_yellowColorCode$_groupSeparator Fim Body $_groupSeparator');
    }
    debugPrint('$_yellowColorCode$_lineSeparator');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('$_cianoColorCode$_lineSeparator');
    debugPrint(
      '$_cianoColorCode<-- ${response.statusCode} ${response.statusMessage} '
      '${_getRequestUrl(response.requestOptions)}',
    );
    if (showHeaders) {
      debugPrint('$_cianoColorCode$_groupSeparator Headers $_groupSeparator');
      response.headers.forEach(
        (key, value) => debugPrint('$_cianoColorCode$key: $value'),
      );
      debugPrint(
          '$_cianoColorCode$_groupSeparator Fim Headers $_groupSeparator');
    }

    debugPrint('$_cianoColorCode$_groupSeparator Response $_groupSeparator');
    debugPrint(_isTipoRespostaEmBytes(response)
        ? "$_cianoColorCode${_formatarBytes(response.data)}"
        : _formatarJSON(response.data, _cianoColorCode));

    debugPrint(
        '$_cianoColorCode$_groupSeparator Fim Response $_groupSeparator');

    debugPrint('$_cianoColorCode$_lineSeparator');
    handler.next(response);
  }

  String _formatarBytes(dynamic data) {
    final bytes = Uint8List.fromList(data);
    return '--> ${bytes.sublist(0, 5)}...Um monte de bytes...';
  }

  bool _isTipoRespostaEmBytes(Response<dynamic> response) =>
      response.requestOptions.responseType == ResponseType.bytes;
}

String get _groupSeparator => '-' * 30;
String get _lineSeparator => '-' * 80;
String get _redColorCode => Platform.isIOS ? '' : '\u001b[31m ';
String get _yellowColorCode => Platform.isIOS ? '' : '\u001b[33m ';
String get _cianoColorCode => Platform.isIOS ? '' : '\u001b[1m \u001b[36m ';
