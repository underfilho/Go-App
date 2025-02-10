import 'package:go_app/app/domain/entities/categoria_item.dart';
import 'package:go_app/app/domain/entities/item.dart';
import 'package:go_app/app/domain/entities/periodo.dart';

class Suite {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<Item> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });
}
