import 'package:go_app/app/data/models/suite_model.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motel_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MotelModel extends Motel {
  @JsonKey(name: 'suites')
  final List<SuiteModel> suitesModel;

  const MotelModel({
    required super.fantasia,
    required super.logo,
    required super.bairro,
    required super.distancia,
    required super.qtdFavoritos,
    required this.suitesModel,
    required super.qtdAvaliacoes,
    required super.media,
  }) : super(suites: suitesModel);

  factory MotelModel.fromJson(Map<String, dynamic> json) =>
      _$MotelModelFromJson(json);
  Map<String, dynamic> toJson() => _$MotelModelToJson(this);
}
