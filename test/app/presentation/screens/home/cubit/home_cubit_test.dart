import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_app/app/core/errors/failure.dart';
import 'package:go_app/app/domain/usecases/buscar_moteis_usecase.dart';
import 'package:go_app/app/ui/screens/home/cubits/home_cubit.dart';
import 'package:go_app/app/ui/screens/home/cubits/home_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mock_model.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([BuscarMoteisUseCase])
void main() {
  late MockBuscarMoteisUseCase buscarMoteis;
  // SUT
  late HomeCubit cubit;

  setUp(() {
    buscarMoteis = MockBuscarMoteisUseCase();
    cubit = HomeCubit(buscarMoteis);
  });

  tearDown(() => cubit.close());

  group('Cenário ideal, deve buscar e carregar a lista de motéis', () {
    void preencherMoteis() {
      when(buscarMoteis.call()).thenAnswer((_) async => right(mockMoteis));
    }

    test('Estado inicial deve ser initial', () async {
      expect(cubit.state, HomeState.initial());
    });

    blocTest(
      'Ao chamar init deve mudar para loading e depois para done com os resultados',
      build: () => HomeCubit(buscarMoteis),
      act: (cubit) {
        preencherMoteis();
        cubit.init();
      },
      expect: () => [
        HomeState.loading(),
        HomeState.done(mockMoteis),
      ],
    );
  });

  group('Caso de falha, cubit lançar status de Failure', () {
    void retornarFalha(Failure failure) {
      when(buscarMoteis.call()).thenAnswer((_) async => left(failure));
    }

    final failure = ConnectionFailure();
    blocTest(
      'Ao chamar init com falha, deve mudar para loading e depois para falha',
      build: () => HomeCubit(buscarMoteis),
      act: (cubit) {
        retornarFalha(failure);
        cubit.init();
      },
      expect: () => [
        HomeState.loading(),
        HomeState.failed(failure),
      ],
    );
  });
}
