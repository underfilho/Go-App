import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:go_app/app/core/errors/failure.dart';
import 'package:go_app/app/core/utils/typedefs.dart';
import 'package:go_app/app/data/datasources/motel_datasource.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:go_app/app/domain/repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelDatasource _datasource;

  MotelRepositoryImpl(this._datasource);

  @override
  AsyncResult<List<Motel>> buscarMoteis() async {
    try {
      final moteis = await _datasource.buscarMoteis();
      return right(moteis);
    } on SocketException {
      return left(ConnectionFailure());
    } on TimeoutException {
      return left(TimeoutFailure());
    }
  }
}
