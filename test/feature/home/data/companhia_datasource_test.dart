import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pop_network/pop_network.dart';
import 'package:tree_view/features/home/data/datasource/companhia_datasource.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';

void main() {
  late IApiManager apiManagerMock;
  late ComponhiaDatasource componhiaDatasource;

  setUp(() {
    apiManagerMock = IApiManagerMock();
    componhiaDatasource = ComponhiaDatasource(apiManager: apiManagerMock);
  });
  group('Função obterCompanias:', () {
    test(
      'deve retornar um Response com erro quando a API '
      'retornar um status de erro',
      () async {
        when(
          () => apiManagerMock.get<dynamic>(
            '/companies',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => tErro);

        final response = await componhiaDatasource.obterCompanhias();

        expect(response.statusCode, 400);
        expect(response.data, isA<String>());
      },
    );

    test(
      'deve retornar companhias'
      ' quando o status for sucesso',
      () async {
        final mockResponse = Response<dynamic>(
          statusCode: 200,
          data: <String, dynamic>{},
          requestOptions: RequestOptions(),
        );

        when(
          () => apiManagerMock.get<dynamic>(
            '/companies',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final response = await componhiaDatasource.obterCompanhias();

        expect(response, mockResponse);
      },
    );
  });

  group('Função obterLocalizacoes:', () {
    const id = '1';
    test(
      'deve retornar um Response com erro quando a API '
      'retornar um status de erro',
      () async {
        when(
          () => apiManagerMock.get<dynamic>(
            '/companies/$id/locations',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => tErro);

        final response = await componhiaDatasource.obterLocalizacoes('1');

        expect(response.statusCode, 400);
        expect(response.data, isA<String>());
      },
    );

    test(
      'deve retornar localizacoes'
      ' quando o status for sucesso',
      () async {
        final mockResponse = Response<dynamic>(
          statusCode: 200,
          data: <String, dynamic>{},
          requestOptions: RequestOptions(),
        );

        when(
          () => apiManagerMock.get<dynamic>(
            '/companies/$id/locations',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final response = await componhiaDatasource.obterLocalizacoes(id);

        expect(response, mockResponse);
      },
    );
  });

  group('Função obterAssets:', () {
    const id = '1';
    test(
      'deve retornar um Response com erro quando a API '
      'retornar um status de erro',
      () async {
        when(
          () => apiManagerMock.get<dynamic>(
            '/companies/$id/assets ',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => tErro);

        final response = await componhiaDatasource.obterAssets('1');

        expect(response.statusCode, 400);
        expect(response.data, isA<String>());
      },
    );

    test(
      'deve retornar assets'
      ' quando o status for sucesso',
      () async {
        final mockResponse = Response<dynamic>(
          statusCode: 200,
          data: <String, dynamic>{},
          requestOptions: RequestOptions(),
        );

        when(
          () => apiManagerMock.get<dynamic>(
            '/companies/$id/assets ',
            mockReplyParams: any(named: 'mockReplyParams'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final response = await componhiaDatasource.obterAssets(id);

        expect(response, mockResponse);
      },
    );
  });
}
