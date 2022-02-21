import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
import 'package:project_test/app/core/rest_client/rest_client_response.dart';
import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';
import '../../../core/helpers/logger.mocks.dart';
import '../../../core/rest_client/dio_rest_client.mocks.dart';

void main() {
  final restClient = MockRestClient();
  final logger = MockLogger();

  final datasource =
      CharactersDataSourceImpl(log: logger, restClient: restClient);

  group('testing method list character in character datasource class', () {
    dynamic error;

    test('must completed and return status 200 ', () async {
      when(restClient.get(any)).thenAnswer((_) async =>
          RestClientResponse(statusCode: HttpStatus.ok, data: <String, dynamic>{
            'data': {
              'results': [{}]
            }
          }));

      final future = datasource.getListCharacters('');
      expect(future, completes);
      final result = completes;
      expect(result, isNotNull);
    });

    test('must throw Unathorized when dio return status 401 ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
        statusCode: 401,
        error: error,
      ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<GetListCharactersUnauthorizedException>()));
    });

    test('must throw Forbidden error when dio return status 403 ', () async {
      when(restClient.get(any))
          .thenThrow(RestClientException(error: error, statusCode: 403));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<GetListCharactersForbiddenException>()));
    });

    test('must throw Failure error when dio return UknowError ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
        error: error,
      ));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<Failure>()));
    });

    test('must throw TimeOut error when dio return Time Out  ', () {
      when(restClient.get(any)).thenThrow(RestClientException(
          error: 'Connecting timed out [60ms]',
          statusCode: null,
          message: null));

      final future = datasource.getListCharacters('');
      expect(future, throwsA(isA<GetListCharactersTimeOutException>()));
    });
  });
}

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:project_test/app/core/helpers/logger.dart';
// import 'package:project_test/app/core/rest_client/rest_client.dart';
// import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
// import 'package:project_test/app/core/rest_client/rest_client_response.dart';
// import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
// import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';

// class MockRestClient extends Mock implements RestClient {}

// class MockRestClientException extends Mock implements RestClientException {}

// class MockRestClientResponse extends Mock implements RestClientResponse {}

// class MockCharacterDatasourceImpl extends Mock
//     implements CharactersDataSourceImpl {}

// class MockLogger extends Mock implements Logger {}

// void main() {
//   late RestClient _restClient;
//   late RestClientException _restclientException;
//   late RestClientResponse _restClientResponse;
//   late Logger _log;
//   late CharactersDataSourceImpl _charactersDataSourceImpl;
//   final a = MockRestClient();
//   setUp(() {
//     _restClient = MockRestClient();
//     _restclientException = MockRestClientException();
//     _restClientResponse = MockRestClientResponse();
//     _log = MockLogger();
//     _charactersDataSourceImpl = MockCharacterDatasourceImpl();
//   });

//   group('testing method list character in character datasource class', () {
//     List list = [];
//     test('must completed and return status 200', () async {
//       when(() => _restClient.get(any()))
//           .thenAnswer((_) async => RestClientResponse(
//                 statusCode: 200,
//                 data: <String, dynamic>{
//                   'data': {
//                     'results': [{}]
//                   }
//                 },
//               ));

//       final future = _charactersDataSourceImpl.getListCharacters('');
//       expect(future, isNull);
//     });

//     test('must completed and return status 403', () async {
//       dynamic error;
//       when(() => _restClient.get(any())).thenThrow(RestClientException(
//           error: error,
//           response: RestClientResponse(statusCode: 403, data: error)));

//       final future = _charactersDataSourceImpl.getListCharacters('');
//       expect(future, throwsA(isA<GetListCharactersUnauthorizedException>()));
//     });
//   });
// }
