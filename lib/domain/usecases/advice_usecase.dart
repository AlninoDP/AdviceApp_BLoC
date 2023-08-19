import 'package:adviceapp/data/repositories/advice_repository_impl.dart';
import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final adviceRepo = AdviceRepositoryImpl();
  Future<Either<AdviceEntity, Failures>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
