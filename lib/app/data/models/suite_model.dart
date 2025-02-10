import 'package:go_app/app/data/models/categoria_item_model.dart';
import 'package:go_app/app/data/models/item_model.dart';
import 'package:go_app/app/data/models/periodo_model.dart';
import 'package:go_app/app/domain/entities/suite.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suite_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SuiteModel extends Suite {
  @JsonKey(name: 'itens')
  final List<ItemModel> itensModel;
  @JsonKey(name: 'categoriaItens')
  final List<CategoriaItemModel> categoriaItensModel;
  @JsonKey(name: 'periodos')
  final List<PeriodoModel> periodosModel;

  SuiteModel({
    required super.nome,
    required super.qtd,
    required super.exibirQtdDisponiveis,
    required super.fotos,
    required this.itensModel,
    required this.categoriaItensModel,
    required this.periodosModel,
  }) : super(
          itens: itensModel,
          categoriaItens: categoriaItensModel,
          periodos: periodosModel,
        );

  factory SuiteModel.fromJson(Map<String, dynamic> json) =>
      _$SuiteModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuiteModelToJson(this);
}
