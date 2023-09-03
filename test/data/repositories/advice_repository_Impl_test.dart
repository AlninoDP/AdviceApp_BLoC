import 'dart:io';

import 'package:adviceapp/data/data_sources/remote_datasources/advice_remote_datasource_impl.dart';
import 'package:adviceapp/data/exception/exception.dart';
import 'package:adviceapp/data/models/advice_model.dart';
import 'package:adviceapp/data/repositories/advice_repository_impl.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'advice_repository_Impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImpl>()])
void main() {
  group('Advice Repositories Impl', () {
    group('should return AdviceEntity', () {
      test('when AdviceRemoteDatasource returns an AdviceModel', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDatasourceImpl();
        final adviceRepositoriesImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasourceImpl: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(id: 12, advice: 'test')));

        final result =
            await adviceRepositoriesImplUnderTest.getAdviceFromDatasource();

        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result,
            Left<AdviceModel, Failures>(AdviceModel(id: 12, advice: 'test')));
        verify(mockAdviceRemoteDatasource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasource);
      });
    });

    group('should return right ', () {
      test('with ServerFailure when ServerException occur', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDatasourceImpl();
        final adviceRepositoriesImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasourceImpl: mockAdviceRemoteDatasource);
        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi())
            .thenThrow(ServerException());

        final result =
            await adviceRepositoriesImplUnderTest.getAdviceFromDatasource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceModel, Failures>(ServerFailures()));
      });

      test('with GeneralFailure when other exception occur', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDatasourceImpl();
        final adviceRepositoriesImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasourceImpl: mockAdviceRemoteDatasource);
        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi())
            .thenThrow(const SocketException('test'));

        final result =
            await adviceRepositoriesImplUnderTest.getAdviceFromDatasource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceModel, Failures>(GeneralFailures()));
      });
    });
  });
}
