import 'package:get_it/get_it.dart';
import 'package:tree_view/shared/injector/base_injector.dart';

class HomeInjector extends BaseInjector {
  @override
  Future<void> call(GetIt dependency) async {}

  @override
  String get scopeName => toString();
}
