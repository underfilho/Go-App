import 'dart:convert';
import 'dart:io';

import 'package:go_app/app/core/network/rest_client.dart';
import 'package:go_app/app/data/models/motel_model.dart';
import 'package:http/http.dart';

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
      final json = _readBody(response);

      final moteisJson = List.from(json['data']['moteis']);

      final moteis = moteisJson.map((e) => MotelModel.fromJson(e)).toList();
      return moteis;
    } else {
      throw HttpException('${response.statusCode}: ${response.reasonPhrase}');
    }
  }

  Map _readBody(Response response) {
    try {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      return jsonDecode(response.body);
    }
  }
}
