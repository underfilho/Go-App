import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_app/app/core/network/rest_client.dart';
import 'package:go_app/app/data/datasources/motel_datasource.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'motel_datasource_test.mocks.dart';

@GenerateMocks([RestClient])
void main() {
  late MockRestClient restClient;
  // SUT
  late MotelDatasource datasource;
  late final String apiMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    apiMock = await rootBundle.loadString('assets/apimock.json');
  });

  setUp(() {
    restClient = MockRestClient();
    datasource = MotelDataSourceImpl(restClient);
  });

  group('Cenário ideal, busca com sucesso', () {
    void preencherRequisicao() {
      when(restClient.get(any)).thenAnswer((_) async => Response(apiMock, 200));
    }

    test('Datasource deve fazer uma requisição GET', () async {
      preencherRequisicao();
      await datasource.buscarMoteis();
      verify(restClient.get(any)).called(1);
      verifyNoMoreInteractions(restClient);
    });

    test('Datasource deve retornar lista de motéis', () async {
      preencherRequisicao();
      final result = await datasource.buscarMoteis();
      expect(result, isA<List<Motel>>());
      expect(result, isNotEmpty);
    });
  });

  group('Exceptions por erro HTTP', () {
    void lancarHttpError(int statusCode) {
      when(restClient.get(any))
          .thenAnswer((_) async => Response('error', statusCode));
    }

    test(
      'Ao receber um erro HTTP 400 deve lançar HTTPException com o código',
      () async {
        lancarHttpError(400);
        expect(
          datasource.buscarMoteis(),
          throwsA(
            predicate((e) => e is HttpException && e.message.contains('400')),
          ),
        );
      },
    );

    test(
      'Ao receber um erro HTTP 500 deve lançar HTTPException com o código',
      () async {
        lancarHttpError(500);
        expect(
          datasource.buscarMoteis(),
          throwsA(
            predicate((e) => e is HttpException && e.message.contains('500')),
          ),
        );
      },
    );
  });
}
