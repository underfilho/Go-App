import 'package:flutter_test/flutter_test.dart';
import 'package:go_app/app/domain/entities/periodo.dart';

void main() {
  test('Deve retornar a porcentagem de desconto corretamente', () {
    final periodo1 = Periodo(
      tempoFormatado: '3 horas',
      valor: 100,
      valorTotal: 50,
      desconto: 50,
      temCortesia: false,
    );
    final periodo2 = Periodo(
      tempoFormatado: '2 horas',
      valor: 100,
      valorTotal: 75,
      desconto: 25,
      temCortesia: false,
    );

    expect(periodo1.porcentagemDesconto, 50);
    expect(periodo2.porcentagemDesconto, 25);
  });
}
