import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/features/common/domain/usecases/obter_localizacoes_usecase.dart';

import '../../../utils/constants.dart';
import '../../utils/common_utils.dart';

void main() {
  late ICompanyRepository repository;
  late ObterLocalizacoesUsecase obterAssetsUsecase;

  setUp(() {
    repository = MockCompanyRepository();
    obterAssetsUsecase = ObterLocalizacoesUsecase(repository: repository);
  });

  group('ObterLocalizacoesUsecase', () {
    test('Deve retorna sucesso', () async {
      //Given:
      when(() => repository.obterLocalizacoes(any()))
          .thenAnswer((_) async => const Right([]));
      //When:
      final result = await obterAssetsUsecase('');
      //Then:

      expect(result.isRight(), isTrue);
    });
    test('Deve retorna erro', () async {
      //Given:

      when(() => repository.obterLocalizacoes(any()))
          .thenAnswer((_) async => Left(tErrorLeft));
      //When:
      final result = await obterAssetsUsecase('');

      //Then:

      expect(result.isLeft(), isTrue);
    });
  });
}
