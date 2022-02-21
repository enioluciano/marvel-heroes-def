import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';
import 'package:project_test/app/pages/characters/infra/repository/characters_repository_impl.dart';
import '../../../core/helpers/logger.mocks.dart';
import '../datasources/mocks/datasource.mocks.dart';
import '../models/json_model/comics_repository.dart';

void main() {
  final datasource = MockCharactersDataSource();
  final logger = MockLogger();
  final repository =
      CharactersRepositoryImpl(charactersDataSource: datasource, log: logger);
  final listComics = comics;

  group('mocked datasource comic repository tests', () {
    int id = 0;
    test('must complete', () async {
      when(datasource.getListComics(id)).thenAnswer((_) async => listComics);
      final future = repository.getListComics(id);
      expect(future, completes);
    });

    test('must return a populed  list comics', () async {
      when(datasource.getListComics(id)).thenAnswer((_) async => listComics);
      final result = await repository.getListComics(id);
      expect(result, isA<List<ComicNewModel>>());
      expect(result, isNotEmpty);
    });

    test('when a datasource return TimeOut for repository', () async {
      when(datasource.getListComics(id))
          .thenThrow(GetListComicsTimeOutException());
      final result = repository.getListComics(id);
      expect(result, throwsA(isA<GetListComicsTimeOutException>()));
    });

    test('when a datasource return Unauthorized for repository', () async {
      when(datasource.getListComics(id))
          .thenThrow(GetListComicsUnauthorizedException());
      final result = repository.getListComics(id);
      expect(result, throwsA(isA<GetListComicsUnauthorizedException>()));
    });

    test('when a datasource return Forbidden for repository', () async {
      when(datasource.getListComics(id))
          .thenThrow(GetListComicsForbiddenException());
      final result = repository.getListComics(id);
      expect(result, throwsA(isA<GetListComicsForbiddenException>()));
    });

    test('when a datasource return failure for repository', () async {
      when(datasource.getListComics(id)).thenThrow(Failure());
      final result = repository.getListComics(id);
      expect(result, throwsA(isA<Failure>()));
    });
  });
}
