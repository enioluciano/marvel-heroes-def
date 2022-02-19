import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';

import '../../../services/dio.mocks.dart';

void main() {
  final dio = MockDio();
  final datasource = CharactersDataSourceImpl(dio: dio, server: '');

  group('testing method list character in character datasource class', () {
    final options = RequestOptions(path: '');

    test('must completed and return status 200 ', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(
              requestOptions: options,
              statusCode: HttpStatus.ok,
              data: <String, dynamic>{
                'data': {
                  'results': [{}]
                }
              }));

      final future = datasource.getListCharacters('');
      expect(future, completes);
      final result = completes;
      expect(result, isNotNull);
    });

    test('must throw datasource error when dio return status 500 ', () {
      when(dio.get(any)).thenThrow((_) async => Response(
            requestOptions: options,
            statusCode: HttpStatus.internalServerError,
          ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<DataSourceError>()));
    });

    test('must throw conflict error when dio return status 409 ', () {
      when(dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: options,
            statusCode: HttpStatus.conflict,
          ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<Conflict>()));
    });

    test('must throw notFound error when dio return status 404 ', () {
      when(dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: options,
            statusCode: HttpStatus.notFound,
          ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<NotFound>()));
    });

    test('must throw conflict error when dio return status 403 ', () {
      when(dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: options,
            statusCode: HttpStatus.forbidden,
          ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<Forbidden>()));
    });
  });
}
