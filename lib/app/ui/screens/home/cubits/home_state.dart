import 'package:equatable/equatable.dart';
import 'package:go_app/app/core/errors/failure.dart';
import 'package:go_app/app/domain/entities/motel.dart';

enum HomeStatus { initial, loading, done, failed }

class HomeState extends Equatable {
  final List<Motel>? moteis;
  final HomeStatus status;
  final Failure? failure;

  const HomeState._({required this.status, this.moteis, this.failure});

  const HomeState.initial() : this._(status: HomeStatus.initial);

  const HomeState.loading() : this._(status: HomeStatus.loading);

  const HomeState.done(List<Motel> moteis)
      : this._(status: HomeStatus.done, moteis: moteis);

  const HomeState.failed(Failure failure)
      : this._(status: HomeStatus.failed, failure: failure);

  @override
  List<Object?> get props => [moteis, status, failure];
}
