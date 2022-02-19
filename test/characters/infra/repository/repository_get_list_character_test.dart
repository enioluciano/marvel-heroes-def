import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/repository/characters_repository_impl.dart';

import '../datasources/mocks/datasource.mocks.dart';
import 'json_model/character_repository_model.dart';

void main() {
  final datasource = MockCharactersDataSource();
  final repository = CharactersRepositoryImpl(charactersDataSource: datasource);
  final characters = character;

  group('mocked datasource character repository tests', () {
    test('must complete', () async {
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

    test('Must return an empty list characters if datasource crashes',
        () async {
      when(datasource.getListCharacters('')).thenThrow(DataSourceError());
      final result = repository.getListCharacters('');
      expect(result, throwsA('Houve um erro ao carregar os dados!'));
    });

    test('Must return an empty list characters if conflict', () async {
      when(datasource.getListCharacters('')).thenThrow(Conflict());
      final result = repository.getListCharacters('');
      expect(result,
          throwsA('A solicitação conflitou com os recursos do servidor!'));
    });

    test('Must return an empty list characters if not found', () async {
      when(datasource.getListCharacters('')).thenThrow(NotFound());
      final result = repository.getListCharacters('');
      expect(
          result,
          throwsA(
              'Falha na requisição, pois o servidor não encontrou a rota!'));
    });
  });
}
