import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pop_network/pop_network.dart';
import 'package:tree_view/features/common/data/datasource/companhia_datasource.dart';
import 'package:tree_view/features/common/data/repositories/company_repository.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';

class MockCompanyDatasource extends Mock implements CompanyDatasource {}

void main() {
  late CompanyDatasource datasource;
  late ICompanyRepository repository;
  final tError = Response(
    requestOptions: RequestOptions(),
    statusCode: 400,
    data: "Error",
  );

  final tErrorDecode = Response(
    requestOptions: RequestOptions(),
    statusCode: 200,
    data: {
      'asd': 'asd',
      'test': false,
    },
  );

  setUp(
    () {
      datasource = MockCompanyDatasource();
      repository = CompanyRepository(datasource: datasource);
    },
  );
  group('[ICompanyRepository]obterCompanhias', () {
    test(
      'Deve retornar sucesso',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: [],
          ),
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isRight(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
    test(
      'Deve retornar erro quando retornado pela api',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => tError,
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
    test(
      'Deve retornar erro quando os dados verem incorretos',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => tErrorDecode,
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
  });
  group('[ICompanyRepository]obterCompanhias', () {
    test(
      'Deve retornar sucesso',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: [],
          ),
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isRight(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
    test(
      'Deve retornar erro quando retornado pela api',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => tError,
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
    test(
      'Deve retornar erro quando os dados verem incorretos',
      () async {
        //Given:
        when(() => datasource.obterCompanhias()).thenAnswer(
          (_) async => tErrorDecode,
        );

        //When:
        final result = await repository.obterCompanhias();

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterCompanhias()).called(1);
      },
    );
  });

  group('[ICompanyRepository]obterLocalizacoes', () {
    test(
      'Deve retornar sucesso',
      () async {
        //Given:
        when(() => datasource.obterLocalizacoes(any())).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: [],
          ),
        );

        //When:
        final result = await repository.obterLocalizacoes('');

        //Then:

        expect(result.isRight(), isTrue);
        verify(() => datasource.obterLocalizacoes(any())).called(1);
      },
    );
    test(
      'Deve retornar erro quando retornado pela api',
      () async {
        //Given:
        when(() => datasource.obterLocalizacoes(any())).thenAnswer(
          (_) async => tError,
        );

        //When:
        final result = await repository.obterLocalizacoes('any()');

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterLocalizacoes(any())).called(1);
      },
    );
    test(
      'Deve retornar erro quando os dados verem incorretos',
      () async {
        //Given:
        when(() => datasource.obterLocalizacoes(any())).thenAnswer(
          (_) async => tErrorDecode,
        );

        //When:
        final result = await repository.obterLocalizacoes('any()');

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterLocalizacoes(any())).called(1);
      },
    );
  });

  group('[ICompanyRepository]obterAssets', () {
    test(
      'Deve retornar sucesso',
      () async {
        //Given:
        when(() => datasource.obterAssets(any())).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: [],
          ),
        );

        //When:
        final result = await repository.obterAssets('asd');

        //Then:

        expect(result.isRight(), isTrue);
        verify(() => datasource.obterAssets(any())).called(1);
      },
    );
    test(
      'Deve retornar erro quando retornado pela api',
      () async {
        //Given:
        when(() => datasource.obterAssets(any())).thenAnswer(
          (_) async => tError,
        );

        //When:
        final result = await repository.obterAssets('asd');

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterAssets(any())).called(1);
      },
    );
    test(
      'Deve retornar erro quando os dados verem incorretos',
      () async {
        //Given:
        when(() => datasource.obterAssets(any())).thenAnswer(
          (_) async => tErrorDecode,
        );

        //When:
        final result = await repository.obterAssets('asd');

        //Then:

        expect(result.isLeft(), isTrue);
        verify(() => datasource.obterAssets(any())).called(1);
      },
    );
  });
}
