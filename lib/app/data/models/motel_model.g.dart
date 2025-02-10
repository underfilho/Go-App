// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelModel _$MotelModelFromJson(Map<String, dynamic> json) => MotelModel(
      fantasia: json['fantasia'] as String,
      logo: json['logo'] as String,
      bairro: json['bairro'] as String,
      distancia: (json['distancia'] as num).toDouble(),
      qtdFavoritos: (json['qtdFavoritos'] as num).toInt(),
      suitesModel: (json['suites'] as List<dynamic>)
          .map((e) => SuiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      qtdAvaliacoes: (json['qtdAvaliacoes'] as num).toInt(),
      media: (json['media'] as num).toDouble(),
    );

Map<String, dynamic> _$MotelModelToJson(MotelModel instance) =>
    <String, dynamic>{
      'fantasia': instance.fantasia,
      'logo': instance.logo,
      'bairro': instance.bairro,
      'distancia': instance.distancia,
      'qtdFavoritos': instance.qtdFavoritos,
      'qtdAvaliacoes': instance.qtdAvaliacoes,
      'media': instance.media,
      'suites': instance.suitesModel.map((e) => e.toJson()).toList(),
    };
