import 'package:dartz/dartz.dart';
import 'package:go_app/app/core/errors/failure.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:go_app/app/domain/repositories/motel_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_app/app/domain/usecases/buscar_moteis_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'buscar_moteis_usecase_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  late MockMotelRepository repository;
  // SUT
  late BuscarMoteisUseCase usecase;

  setUp(() {
    repository = MockMotelRepository();
    usecase = BuscarMoteisUseCase(repository);
  });

  group('Cenário ideal, busca de motéis', () {
    final mockMoteis = <Motel>[];

    void preencherBuscarMoteis() {
      when(repository.buscarMoteis())
          .thenAnswer((_) async => right(mockMoteis));
    }

    test('Usecase deve buscar dados no repository', () async {
      preencherBuscarMoteis();
      await usecase();
      verify(repository.buscarMoteis()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('Usecase deve retornar a lista de motéis', () async {
      preencherBuscarMoteis();
      final result = await usecase();
      expect(result, right(mockMoteis));
    });
  });

  group('Testar falha, usecase deve retornar falha', () {
    final failure = ConnectionFailure();

    void preencherFalha() {
      when(repository.buscarMoteis()).thenAnswer((_) async => left(failure));
    }

    test('Deve retornar uma falha à esquerda', () async {
      preencherFalha();
      final response = await usecase();
      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<ConnectionFailure>());
    });
  });
}
