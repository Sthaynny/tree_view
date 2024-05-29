import 'package:get_it/get_it.dart';
import 'package:pop_network/pop_network.dart';
import 'package:tree_view/shared/api/logging_interceptor.dart';
import 'package:tree_view/shared/injector/base_injector.dart';

class CommonInjector extends BaseInjector {
  @override
  void call(GetIt dependency) async {
    dependency.registerLazySingleton<IApiManager>(
      () => ApiManager(
        baseUrl: 'fake-api.tractian.com',
        receiveTimeout: 70,
        interceptors: [
          LoggingInterceptor(),
        ],
        // loadMockAsset:
        //     Ambiente.instance.isMockHabilitado ? (str) => rootBundle.loadString('assets/api/mocks/$str.json') : null,
      ),
    );
  }

  @override
  String get scopeName => 'micro_common';
}
