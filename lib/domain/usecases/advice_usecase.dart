import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final AdviceRepository adviceRepository;
  AdviceUsecase({required this.adviceRepository});
  Future<Either<AdviceEntity, Failures>> getAdvice() async {
    return adviceRepository.getAdviceFromDatasource();
  }
}
