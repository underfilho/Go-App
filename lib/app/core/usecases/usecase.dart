import 'package:go_app/app/core/utils/typedefs.dart';

abstract class UseCase<Type, Params> {
  AsyncResult<Type> call(Params params);
}
