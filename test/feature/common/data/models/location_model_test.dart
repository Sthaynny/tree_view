import 'package:flutter_test/flutter_test.dart';
import 'package:tree_view/features/common/data/models/location_model.dart';
import 'package:tree_view/features/common/domain/entities/location_entity.dart';

void main() {
  const tInstanceLocationModel = LocationModel(id: 'id', name: 'name');
  final tMapLocation = <String, dynamic>{'id': 'id', 'name': 'name'};

  test('Deve retornar uma instancia de LocationEntity', () {
    expect(tInstanceLocationModel, isA<LocationEntity>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = LocationModel.fromMap(tMapLocation);

    expect(result, isA<LocationEntity>());
  });

  test('Deve retornar um Map', () {
    final result = tInstanceLocationModel.toMap();

    expect(result, isA<Map>());
  });
}
