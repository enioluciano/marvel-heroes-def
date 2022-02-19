import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';
import 'package:project_test/app/pages/characters/infra/repository/characters_repository_impl.dart';
import '../datasources/mocks/datasource.mocks.dart';
import 'json_model/comics_repository.dart';

void main() {
  final datasource = MockCharactersDataSource();
  final repository = CharactersRepositoryImpl(charactersDataSource: datasource);
  final comics = comic;

  group('mocked datasource comic repository tests', () {
    int id = 0;
    test('must complete', () async {
      when(datasource.getListComics(id)).thenAnswer((_) async => comics);
      final future = repository.getListComics(id);
      expect(future, completes);
    });

    test('must return a populed  list comics', () async {
      when(datasource.getListComics(id)).thenAnswer((_) async => comics);
      final result = await repository.getListComics(id);
      expect(result, isA<List<ComicNewModel>>());
      expect(result, isNotEmpty);
    });

    test('Must return an empty list comics if datasource crashes', () async {
      when(datasource.getListComics(id)).thenThrow(DataSourceError());
      final result = repository.getListComics(id);
      expect(result, throwsA('Houve um erro ao carregar os dados!'));
      // expect(result, isEmpty);
    });

    test('Must return an empty list comics if conflict', () async {
      when(datasource.getListComics(id)).thenThrow(Conflict());
      final result = repository.getListComics(id);
      expect(result,
          throwsA('A solicitação conflitou com os recursos do servidor!'));
    });

    test('Must return an empty list comics if not found', () async {
      when(datasource.getListComics(id)).thenThrow(NotFound());
      final result = repository.getListComics(id);
      expect(
          result,
          throwsA(
              'Falha na requisição, pois o servidor não encontrou a rota!'));
    });
  });
}
