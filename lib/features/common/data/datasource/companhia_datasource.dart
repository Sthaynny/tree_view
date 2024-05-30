import 'package:pop_network/pop_network.dart';

class CompanyDatasource {
  final IApiManager _apiManager;

  CompanyDatasource({
    required IApiManager apiManager,
  }) : _apiManager = apiManager;

  Future<Response> obterCompanhias() {
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
