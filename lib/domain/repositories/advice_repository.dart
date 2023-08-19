import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepository {
  Future<Either<AdviceEntity, Failures>> getAdviceFromDatasource();
}
