import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  @override
  Future<Either<AdviceEntity, Failures>> getAdviceFromDatasource() {
    // TODO: implement getAdviceFromDatasource
    throw UnimplementedError();
  }
}
