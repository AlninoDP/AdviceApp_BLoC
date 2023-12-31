import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource.dart';
import 'package:adviceapp/data/exception/exception.dart';
import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDatasource adviceRemoteDatasourceImpl;
  AdviceRepositoryImpl({required this.adviceRemoteDatasourceImpl});
  @override
  Future<Either<AdviceEntity, Failures>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasourceImpl.getRandomAdviceFromApi();
      return left(result);
    } on ServerException catch (_) {
      return right(ServerFailures());
    } catch (e) {
      return right(GeneralFailures());
    }
  }
}
