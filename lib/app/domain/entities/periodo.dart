class Periodo {
  final String tempoFormatado;
  final double valor;
  final double valorTotal;
  final double? desconto;
  final bool temCortesia;

  double get porcentagemDesconto => (desconto ?? 0) / valor * 100;

  Periodo({
    required this.tempoFormatado,
    required this.valor,
    required this.valorTotal,
    required this.desconto,
    required this.temCortesia,
  });
}
