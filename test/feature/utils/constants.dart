import 'package:pop_network/pop_network.dart';
import 'package:tree_view/shared/api/error_response.dart';

final tErro = Response(
  requestOptions: RequestOptions(),
  data: 'Ocorreu um erro',
  statusCode: 400,
);

final tErrorLeft = ErrorResponse.withMappedError();
