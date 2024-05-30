import 'package:pop_network/pop_network.dart';

class ErrorResponse extends Response<dynamic> {
  ErrorResponse({
    required super.requestOptions,
    required super.data,
    required int super.statusCode,
  });

  factory ErrorResponse.withMappedError({
    String? message,
    String? code,
    int? statusCode,
  }) =>
      ErrorResponse(
        requestOptions: RequestOptions(),
        data: message ?? 'Ocorreu um erro, Tente novamente',
        statusCode: statusCode ?? 400,
      );
}
