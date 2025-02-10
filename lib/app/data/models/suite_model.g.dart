// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuiteModel _$SuiteModelFromJson(Map<String, dynamic> json) => SuiteModel(
      nome: json['nome'] as String,
      qtd: (json['qtd'] as num).toInt(),
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] as bool,
      fotos: (json['fotos'] as List<dynamic>).map((e) => e as String).toList(),
      itensModel: (json['itens'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriaItensModel: (json['categoriaItens'] as List<dynamic>)
          .map((e) => CategoriaItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuiteModelToJson(SuiteModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'qtd': instance.qtd,
      'exibirQtdDisponiveis': instance.exibirQtdDisponiveis,
      'fotos': instance.fotos,
      'itens': instance.itensModel.map((e) => e.toJson()).toList(),
      'categoriaItens':
          instance.categoriaItensModel.map((e) => e.toJson()).toList(),
    };
