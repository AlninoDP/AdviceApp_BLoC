import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource_impl.dart';
import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDatasourceImpl adviceRemoteDatasourceImpl =
      AdviceRemoteDatasourceImpl();
  @override
  Future<Either<AdviceEntity, Failures>> getAdviceFromDatasource() async {
    final result = await adviceRemoteDatasourceImpl.getRandomAdviceFromApi();
    return left(result);
  }
}
