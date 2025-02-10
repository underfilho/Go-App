import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_app/app/core/errors/failure.dart';
import 'package:go_app/app/data/models/motel_model.dart';
import 'package:go_app/app/data/repositories/motel_repository.dart';
import 'package:go_app/app/domain/repositories/motel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:go_app/app/data/datasources/motel_datasource.dart';
import 'package:mockito/mockito.dart';

import 'motel_repository_test.mocks.dart';

@GenerateMocks([MotelDatasource])
void main() {
  late MockMotelDatasource datasource;
  // SUT
  late MotelRepository repository;

  setUp(() {
    datasource = MockMotelDatasource();
    repository = MotelRepositoryImpl(datasource);
  });

  group('Cenário ideal, busca de motéis', () {
    final mockMoteis = <MotelModel>[];

    void preencherBuscarMoteis() {
      when(datasource.buscarMoteis()).thenAnswer((_) async => mockMoteis);
    }

    test('Repository deve buscar dados no datasource', () async {
      preencherBuscarMoteis();
      await repository.buscarMoteis();
      verify(datasource.buscarMoteis()).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('Repository deve retornar a lista de motéis', () async {
      preencherBuscarMoteis();
      final result = await repository.buscarMoteis();
      expect(result, right(mockMoteis));
    });
  });

  group(
    '''Testar exceptions, repository deve tratar e retornar Failure
    ou deixar quebrar quando não tem tratamento específico para ter feedback
    ''',
    () {
      void lancarException(Exception e) {
        when(datasource.buscarMoteis()).thenThrow(e);
      }

      test(
        'Ao receber TimeoutException deve retornar TimeoutFailure',
        () async {
          lancarException(TimeoutException(null));
          final response = await repository.buscarMoteis();
          final result = response.fold((l) => l, (r) => r);
          expect(result, isA<TimeoutFailure>());
        },
      );

      test(
        'Ao receber SocketException deve retornar ConnectionFailure',
        () async {
          lancarException(SocketException(''));
          final response = await repository.buscarMoteis();
          final result = response.fold((l) => l, (r) => r);
          expect(result, isA<ConnectionFailure>());
        },
      );

      test('Ao receber Exception não tratada, deixar ser lançada', () async {
        lancarException(Exception());
        expect(repository.buscarMoteis(), throwsA(isA<Exception>()));
      });
    },
  );
}
