import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/infra/datasources/characters_datasource.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersDataSource charactersDataSource;
  final Logger _log;
  CharactersRepositoryImpl(
      {required this.charactersDataSource, required Logger log})
      : _log = log;
  @override
  Future<List<CharacterModel>> getListCharacters(String aditional) async {
    try {
      final data = await charactersDataSource.getListCharacters(aditional);
      List<CharacterModel> characters =
          data.map((character) => CharacterModel.fromJson(character)).toList();

      return characters;
    } on GetListCharactersTimeOutException {
      rethrow;
    } on GetListCharactersUnauthorizedException {
      rethrow;
    } on GetListCharactersForbiddenException {
      rethrow;
    } on Failure {
      rethrow;
    } catch (err, stackTrace) {
      _log.error('SessionRepository - getListCharacters', err, stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<ComicNewModel>> getListComics(int id) async {
    try {
      final data = await charactersDataSource.getListComics(id);
      List<ComicNewModel> characters =
          data.map((comic) => ComicNewModel.fromJson(comic)).toList();

      return characters;
    } on GetListComicsTimeOutException {
      rethrow;
    } on GetListComicsUnauthorizedException {
      rethrow;
    } on GetListComicsForbiddenException {
      rethrow;
    } on Failure {
      rethrow;
    } catch (err, stackTrace) {
      _log.error('SessionRepository - getListComics', err, stackTrace);
      rethrow;
    }
  }
}
