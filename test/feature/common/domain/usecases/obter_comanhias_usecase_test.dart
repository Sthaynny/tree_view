import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/features/common/domain/usecases/obter_comanhias_usecase.dart';

import '../../../utils/constants.dart';
import '../../utils/common_utils.dart';

void main() {
  late ICompanyRepository repository;
  late ObterComanhiasUsecase obterComanhiasUsecase;

  setUp(() {
    repository = MockCompanyRepository();
    obterComanhiasUsecase = ObterComanhiasUsecase(repository: repository);
  });

  group('ObterComanhiasUsecase', () {
    test('Deve retorna sucesso', () async {
      //Given:
      when(() => repository.obterCompanhias())
          .thenAnswer((_) async => const Right([]));
      //When:
      final result = await obterComanhiasUsecase();
      //Then:

      expect(result.isRight(), isTrue);
    });
    test('Deve retorna erro', () async {
      //Given:

      when(() => repository.obterCompanhias())
          .thenAnswer((_) async => Left(tErrorLeft));
      //When:
      final result = await obterComanhiasUsecase();

      //Then:

      expect(result.isLeft(), isTrue);
    });
  });
}
