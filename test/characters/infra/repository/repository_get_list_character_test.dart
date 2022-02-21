import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/repository/characters_repository_impl.dart';

import '../../../core/helpers/logger.mocks.dart';
import '../datasources/mocks/datasource.mocks.dart';
import '../models/json_model/character_repository_model.dart';

void main() {
  final datasource = MockCharactersDataSource();
  final logger = MockLogger();
  final repository =
      CharactersRepositoryImpl(charactersDataSource: datasource, log: logger);
  final characters = character;

  group('mocked datasource character repository tests', () {
    test('when return is completed', () async {
      when(datasource.getListCharacters(''))
          .thenAnswer((_) async => characters);
      final future = repository.getListCharacters('');
      expect(future, completes);
    });

    test('must return a populed  list character', () async {
      when(datasource.getListCharacters(''))
          .thenAnswer((_) async => characters);
      final result = await repository.getListCharacters('');
      expect(result, isA<List<CharacterModel>>());
      expect(result, isNotEmpty);
    });

    test('when a datasource return Forbidden for repository', () async {
      when(datasource.getListCharacters(''))
          .thenThrow(GetListCharactersForbiddenException());
      final result = repository.getListCharacters('');
      expect(result, throwsA(isA<GetListCharactersForbiddenException>()));
    });

    test('when a datasource return Unauthorized for repository', () async {
      when(datasource.getListCharacters(''))
          .thenThrow(GetListCharactersUnauthorizedException());
      final result = repository.getListCharacters('');
      expect(result, throwsA(isA<GetListCharactersUnauthorizedException>()));
    });

    test('when a datasource return failure for repository', () async {
      when(datasource.getListCharacters('')).thenThrow(Failure());
      final result = repository.getListCharacters('');
      expect(result, throwsA(isA<Failure>()));
    });

    // test('when a repository return exception trow', () async {
    //   when(repository.getListCharacters('')).thenThrow(Exception());
    //   final result = await repository.getListCharacters('');
    //   expect(result, throwsA(isA<Exception>()));
    // });
  });
}
