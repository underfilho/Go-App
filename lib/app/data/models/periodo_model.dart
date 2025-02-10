import 'package:go_app/app/domain/entities/periodo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'periodo_model.g.dart';

@JsonSerializable()
class PeriodoModel extends Periodo {
  @JsonKey(fromJson: _descontoFromJson, toJson: null)
  final double? descontoModel;

  PeriodoModel({
    required super.tempoFormatado,
    required super.valor,
    required super.valorTotal,
    required this.descontoModel,
    required super.temCortesia,
  }) : super(desconto: descontoModel);

  factory PeriodoModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodoModelToJson(this);
}

double? _descontoFromJson(Map<String, dynamic>? json) => json?['desconto'];
