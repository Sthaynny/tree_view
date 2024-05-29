import 'package:flutter/material.dart';
import 'package:tree_view/features/app.dart';
import 'package:tree_view/shared/core/app_injector.dart';
import 'package:tree_view/shared/core/core.dart';

void main() {
  AppInjector().call(dependency);
  runApp(const MyApp());
}
