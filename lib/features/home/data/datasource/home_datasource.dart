import 'package:pop_network/pop_network.dart';

class ComponiasDatasource {
  final IApiManager _apiManager;

  ComponiasDatasource({
    required IApiManager apiManager,
  }) : _apiManager = apiManager;

  Future<Response> obterCompanias() {
    return _apiManager.get(
      '/companies',
    );
  }

  Future<Response> obterLocalizacoes(String id) {
    return _apiManager.get(
      '/companies/$id/locations',
    );
  }

  Future<Response> obterAssets(String id) {
    return _apiManager.get(
      '/companies/$id/assets ',
    );
  }
}
