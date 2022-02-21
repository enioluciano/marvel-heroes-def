import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
import 'package:project_test/app/core/rest_client/rest_client_response.dart';
import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';

import '../../../core/helpers/logger.mocks.dart';
import '../../../core/rest_client/dio_rest_client.mocks.dart';

void main() {
  final restClient = MockRestClient();
  final logger = MockLogger();
  final datasource =
      CharactersDataSourceImpl(log: logger, restClient: restClient);

  group('testing method list comics in character datasource class', () {
    dynamic error;
    test('must completed and return status 200 ', () {
      when(restClient.get(any)).thenAnswer((_) async =>
          RestClientResponse(statusCode: HttpStatus.ok, data: <String, dynamic>{
            'data': {
              'results': [{}]
            }
          }));

      final future = datasource.getListComics(0);
      expect(future, completes);
    });

    test('must throw Unauthorized when dio return status 401 ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
        error: error,
        statusCode: 401,
      ));

      final future = datasource.getListComics(0);
      expect(future, throwsA(isA<GetListComicsUnauthorizedException>()));
    });

    test('must throw Unauthorized when dio return status 403 ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
        error: error,
        statusCode: 403,
      ));

      final future = datasource.getListComics(0);
      expect(future, throwsA(isA<GetListComicsForbiddenException>()));
    });

    test('must throw TimeOut when dio return Time Out ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
          error: 'Connecting timed out [60ms]',
          statusCode: null,
          message: null));

      final future = datasource.getListComics(0);
      expect(future, throwsA(isA<GetListComicsTimeOutException>()));
    });
  });
}
