import 'package:adviceapp/data/models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  /// request a random advice from API
  /// return [AdviceModel] if succesfull
  /// throw a server-Exception if status code not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}
