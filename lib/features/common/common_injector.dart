import 'package:get_it/get_it.dart';
import 'package:tree_view/features/common/data/datasource/companhia_datasource.dart';
import 'package:tree_view/shared/injector/base_injector.dart';

class CommonInjector extends BaseInjector {
  @override
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => ComponhiaDatasource(
        apiManager: dependency(),
      ),
    );
  }

  @override
  String get scopeName => toString();
}
