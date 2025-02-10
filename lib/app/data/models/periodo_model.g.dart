// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periodo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodoModel _$PeriodoModelFromJson(Map<String, dynamic> json) => PeriodoModel(
      tempoFormatado: json['tempoFormatado'] as String,
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      descontoModel:
          _descontoFromJson(json['desconto'] as Map<String, dynamic>?),
      temCortesia: json['temCortesia'] as bool,
    );

Map<String, dynamic> _$PeriodoModelToJson(PeriodoModel instance) =>
    <String, dynamic>{
      'tempoFormatado': instance.tempoFormatado,
      'valor': instance.valor,
      'valorTotal': instance.valorTotal,
      'temCortesia': instance.temCortesia,
      'desconto': instance.descontoModel,
    };
