import 'package:go_app/app/core/utils/typedefs.dart';

abstract class UseCaseNoParams<Type> {
  AsyncResult<Type> call();
}
