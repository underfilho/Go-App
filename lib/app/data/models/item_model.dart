import 'package:go_app/app/domain/entities/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends Item {
  ItemModel({required super.nome});

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
