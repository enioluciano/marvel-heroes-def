// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:project_test/app/core/rest_client/rest_client.dart';
// import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
// import 'package:project_test/app/core/rest_client/rest_client_response.dart';
// import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
// import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
// import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';

// import '../../../core/helpers/logger.mocks.dart';
// import '../../../core/rest_client/dio_rest_client.mocks.dart';
// import '../../../core/rest_client/rest_client_exception.mocks.dart';
// import '../../../services/dio.mocks.dart';

// void main() {
//   final dio = MockDio();
//   final restClient = MockRestClient();
//   final restClientException = MockRestClientException();
//   final logger = MockLogger();
//   final datasource =
//       CharactersDataSourceImpl(log: logger, restClient: restClient);

//   group('testing method list character in character datasource class', () {
//     final options = RequestOptions(path: '');
//     dynamic error;

//     test('must completed and return status 200 ', () async {
//       when(restClient.get(any)).thenAnswer((_) async =>
//           RestClientResponse(statusCode: HttpStatus.ok, data: <String, dynamic>{
//             'data': {
//               'results': [{}]
//             }
//           }));

//       final future = datasource.getListCharacters('');
//       expect(future, completes);
//       final result = completes;
//       expect(result, isNotNull);
//     });

//     test('must throw datasource error when dio return status 403 ', () {
//       dynamic error;
//       when(restClient.get(any)).thenThrow(RestClientException(
//         statusCode: 403,
//         error: error,
//       ));

//       final future = datasource.getListCharacters('');
//       expect(future, throwsA(isA<GetListCharactersUnauthorizedException>()));
//     });

//     // test('must throw conflict error when dio return status 409 ', () async {
//     //   when(restClient.get(any)).thenThrow((_) async => RestClientException(
//     //         error: any,
//     //       ));

//     //   final future = await datasource.getListCharacters('');
//     //   expect(future, throwsA(isA<GetListCharactersTimeOutException>()));
//     // });

//     test('must throw Failure error when dio return status  ', () {
//       dynamic error;
//       when(restClient.get(any)).thenThrow(RestClientException(
//         error: error,
//       ));

//       final future = datasource.getListCharacters('');
//       expect(future, throwsA(isA<Failure>()));
//     });

//     // test('must throw conflict error when dio return status 403 ', () {
//     //   dynamic error;
//     //   when(restClient.get(any)).thenThrow(RestClientException(
//     //     error: error,
//     //   ));

//     //   final future = datasource.getListCharacters('');
//     //   expect(future, throwsA(isA<GetListComicsTimeOutException>()));
//     // });
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/core/rest_client/rest_client.dart';
import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
import 'package:project_test/app/core/rest_client/rest_client_response.dart';
import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';

class MockRestClient extends Mock implements RestClient {}

class MockCharacterDatasourceImpl extends Mock
    implements CharactersDataSourceImpl {}

class MockLogger extends Mock implements Logger {}

void main() {
  late RestClient _restClient;

  late Logger _log;
  late CharactersDataSourceImpl _charactersDataSourceImpl;

  setUp(() {
    _restClient = MockRestClient();
    _log = MockLogger();
    _charactersDataSourceImpl =
        CharactersDataSourceImpl(restClient: _restClient, log: _log);
  });

  group('testing method list character in character datasource class', () {
    test('must completed and return status 200', () async {
      when(() => _restClient.get(any()))
          .thenAnswer((_) async => RestClientResponse(
                statusCode: 200,
                data: <String, dynamic>{
                  'data': {
                    'results': [{}]
                  }
                },
              ));

      final future = _charactersDataSourceImpl.getListCharacters('');
      expect(future, completes);
    });

    test('must completed and return status 403', () async {
      dynamic error;
      when(() => _restClient.get(any()))
          .thenThrow(RestClientException(error: error, statusCode: 403));

      final future = _charactersDataSourceImpl.getListCharacters('');
      expect(future, throwsA(isA<GetListCharactersForbiddenException>()));
    });

    test('must completed and return status 401', () async {
      dynamic error;
      when(() => _restClient.get(any()))
          .thenThrow(RestClientException(error: error, statusCode: 401));

      final future = _charactersDataSourceImpl.getListCharacters('');
      expect(future, throwsA(isA<GetListCharactersUnauthorizedException>()));
    });
  });
}
