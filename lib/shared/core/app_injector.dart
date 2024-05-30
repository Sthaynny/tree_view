import 'package:get_it/get_it.dart';
import 'package:tree_view/features/common/common_injector.dart';
import 'package:tree_view/features/home/home_injector.dart';
import 'package:tree_view/shared/common_injector.dart';
import 'package:tree_view/shared/injector/base_injector.dart';

class AppInjector extends BaseInjector {
  List<BaseInjector> get injectors => [
        SharedInjector(),
        CommonInjector(),
        HomeInjector(),
      ];

  @override
  void call(GetIt dependency) async {
    for (var injector in injectors) {
      injector.call(dependency);
    }
  }

  @override
  void unregisterDependencies() {
    for (var injector in injectors) {
      injector.unregisterDependencies();
    }
  }

  @override
  String get scopeName => toString();
}
