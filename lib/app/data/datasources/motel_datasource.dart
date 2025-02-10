import 'dart:convert';
import 'dart:io';

import 'package:go_app/app/core/network/rest_client.dart';
import 'package:go_app/app/data/models/motel_model.dart';

abstract class MotelDatasource {
  Future<List<MotelModel>> buscarMoteis();
}

class MotelDataSourceImpl implements MotelDatasource {
  final RestClient _restClient;

  MotelDataSourceImpl(this._restClient);

  @override
  Future<List<MotelModel>> buscarMoteis() async {
    final response = await _restClient.get('/moteis');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final moteisJson = List.from(json['data']['moteis']);

      final moteis = moteisJson.map((e) => MotelModel.fromJson(e)).toList();
      return moteis;
    } else {
      throw HttpException('${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
