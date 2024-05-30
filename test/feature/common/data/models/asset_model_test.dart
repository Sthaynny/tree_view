import 'package:flutter_test/flutter_test.dart';
import 'package:tree_view/features/common/data/models/asset_model.dart';
import 'package:tree_view/features/common/domain/entities/asset_entity.dart';

void main() {
  const tInstanceAssetsModel = AssetsModel(id: 'id', name: 'name');
  final tMapAssets = <String, dynamic>{'id': 'id', 'name': 'name'};

  test('Deve retornar uma instancia de AssetsEntity', () {
    expect(tInstanceAssetsModel, isA<AssetsEntity>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = AssetsModel.fromMap(tMapAssets);

    expect(result, isA<AssetsEntity>());
  });

  test('Deve retornar um Map', () {
    final result = tInstanceAssetsModel.toMap();

    expect(result, isA<Map>());
  });
}
