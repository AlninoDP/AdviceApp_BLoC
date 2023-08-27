import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource_impl.dart';
import 'package:adviceapp/data/exception/exception.dart';
import 'package:adviceapp/data/models/advice_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'advice_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDatasource', () {
    group('Should return AdviceModel', () {
      test('When client response was 200 and has valid data', () async {
        final mockClient = MockClient();
        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);
        const responseBody = '{"advice_id": 1, "advice": "Test advice"}';

        when(mockClient
            .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'})).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));

        final result =
            await adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();

        expect(result, AdviceModel(id: 1, advice: 'Test advice'));
      });
    });

    group('Should Throw ', () {
      test('Server exception when client response not 200', () async {
        final mockClient = MockClient();
        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);

        when(mockClient.get(
                Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) => Future.value(Response(' ', 404)));

        expect(() => adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi(),
            throwsA(isA<ServerException>()));
      });
    });
    test('a type error when client response was 200 and no valid data',
        () async {
      final mockClient = MockClient();
      final adviceRemoteDatasourceUnderTest =
          AdviceRemoteDatasourceImpl(client: mockClient);
      const responseBody = '{"advice": "Test advice"}';

      when(mockClient
          .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: {'content-type': 'application/json'})).thenAnswer(
          (realInvocation) => Future.value(Response(responseBody, 200)));

      expect(() => adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi(),
          throwsA(isA<TypeError>()));
    });
  });
}
