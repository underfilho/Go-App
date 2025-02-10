import 'package:go_app/app/core/utils/typedefs.dart';
import 'package:go_app/app/domain/entities/motel.dart';

abstract class MotelRepository {
  AsyncResult<List<Motel>> buscarMoteis();
}
