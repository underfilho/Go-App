import 'package:get_it/get_it.dart';
import 'package:go_app/app/core/network/rest_client.dart';
import 'package:go_app/app/data/datasources/motel_datasource.dart';
import 'package:go_app/app/data/repositories/motel_repository.dart';
import 'package:go_app/app/domain/repositories/motel_repository.dart';
import 'package:go_app/app/domain/usecases/buscar_moteis_usecase.dart';
import 'package:go_app/app/ui/screens/home/cubits/home_cubit.dart';
import 'package:go_app/app/ui/routes/myrouter_generator.dart';
import 'package:go_app/app/ui/theme/app_theme.dart';

final di = GetIt.instance;

void initDependencies() {
  di.registerSingleton(RestClient());

  di.registerSingleton<MotelDatasource>(MotelDataSourceImpl(di.get()));
  di.registerSingleton<MotelRepository>(MotelRepositoryImpl(di.get()));

  di.registerSingleton(MyRouterGenerator());
  di.registerSingleton(AppTheme());

  di.registerLazySingleton(() => BuscarMoteisUseCase(di.get()));
  di.registerFactory(() => HomeCubit(di.get()));
}
