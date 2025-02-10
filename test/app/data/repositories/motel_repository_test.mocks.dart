// Mocks generated by Mockito 5.4.5 from annotations
// in go_app/test/app/data/repositories/motel_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:go_app/app/data/datasources/motel_datasource.dart' as _i2;
import 'package:go_app/app/data/models/motel_model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MotelDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMotelDatasource extends _i1.Mock implements _i2.MotelDatasource {
  MockMotelDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.MotelModel>> buscarMoteis() =>
      (super.noSuchMethod(
            Invocation.method(#buscarMoteis, []),
            returnValue: _i3.Future<List<_i4.MotelModel>>.value(
              <_i4.MotelModel>[],
            ),
          )
          as _i3.Future<List<_i4.MotelModel>>);
}
