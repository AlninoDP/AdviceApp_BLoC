import 'package:adviceapp/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource.dart';
import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource_impl.dart';
import 'package:adviceapp/data/repositories/advice_repository_impl.dart';
import 'package:adviceapp/domain/repositories/advice_repository.dart';
import 'package:adviceapp/domain/usecases/advice_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; //* sl = service locator

Future<void> init() async {
  // ! Application Layer
  sl.registerFactory(() => AdvicerCubit(adviceUsecase: sl()));

  // ! Domain Layer
  sl.registerFactory(() => AdviceUsecase(adviceRepository: sl()));

  // ! Data Layer
  sl.registerFactory<AdviceRepository>(
      () => AdviceRepositoryImpl(adviceRemoteDatasourceImpl: sl()));

  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // ! External
  sl.registerFactory(() => http.Client());
}
