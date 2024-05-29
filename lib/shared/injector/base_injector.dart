import 'package:get_it/get_it.dart';
import 'package:tree_view/shared/core/core.dart';

abstract class BaseInjector {
  String get scopeName;

  Future<void> call(GetIt dependency);

  void unregisterDependencies() {
    dependency.popScopesTill(scopeName);
  }

  void registerDependencies() {
    dependency.pushNewScope(
      init: call,
      scopeName: scopeName,
    );
  }
}
