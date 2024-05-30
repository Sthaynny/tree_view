import 'package:flutter_test/flutter_test.dart';
import 'package:tree_view/features/common/data/models/company_model.dart';
import 'package:tree_view/features/common/domain/entities/company_entity.dart';

void main() {
  const tInstanceCompanyModel = CompanyModel(id: 'id', name: 'name');
  final tMapCompany = <String, dynamic>{'id': 'id', 'name': 'name'};

  test('Deve retornar uma instancia de CompanyEntity', () {
    expect(tInstanceCompanyModel, isA<CompanyEntity>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = CompanyModel.fromMap(tMapCompany);

    expect(result, isA<CompanyEntity>());
  });

  test('Deve retornar um Map', () {
    final result = tInstanceCompanyModel.toMap();

    expect(result, tMapCompany);
  });
}
