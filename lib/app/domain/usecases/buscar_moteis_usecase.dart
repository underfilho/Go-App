import 'package:go_app/app/core/usecases/usecase_no_params.dart';
import 'package:go_app/app/core/utils/typedefs.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:go_app/app/domain/repositories/motel_repository.dart';

class BuscarMoteisUseCase implements UseCaseNoParams<List<Motel>> {
  final MotelRepository _repository;

  BuscarMoteisUseCase(this._repository);

  @override
  AsyncResult<List<Motel>> call() async {
    return _repository.buscarMoteis();
  }
}
