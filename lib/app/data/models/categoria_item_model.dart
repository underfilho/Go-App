import 'package:go_app/app/domain/entities/categoria_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoria_item_model.g.dart';

@JsonSerializable()
class CategoriaItemModel extends CategoriaItem {
  CategoriaItemModel({
    required super.nome,
    required super.icone,
  });

  Map<String, dynamic> toJson() => _$CategoriaItemModelToJson(this);
  factory CategoriaItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriaItemModelFromJson(json);
}
