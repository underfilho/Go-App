import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_app/app/domain/usecases/buscar_moteis_usecase.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuscarMoteisUseCase _buscarMoteis;

  HomeCubit(this._buscarMoteis) : super(const HomeState.initial());

  void init() async {
    emit(const HomeState.loading());

    final response = await _buscarMoteis();
    response.fold(
      (failure) => emit(HomeState.failed(failure)),
      (moteis) => emit(HomeState.done(moteis)),
    );
  }
}
