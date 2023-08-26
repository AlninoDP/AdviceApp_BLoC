import 'dart:convert';

import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource.dart';
import 'package:adviceapp/data/exception/exception.dart';
import 'package:adviceapp/data/models/advice_model.dart';
import 'package:http/http.dart' as http;

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDatasourceImpl({required this.client});
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    /// send http request and put the http response in this variable
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      /// put the response body into this variable and conver it from string to json
      /// since json type is like a Map, this variable will have like this
      /// 'advice_id' : 'value',
      /// 'advice':'value'
      final responseBody = json.decode(response.body);

      return AdviceModel.fromJson(responseBody);
    }
  }
}
