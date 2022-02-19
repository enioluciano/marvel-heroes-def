import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/infra/datasources/characters_datasource.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersDataSource charactersDataSource;
  CharactersRepositoryImpl({required this.charactersDataSource});
  @override
  Future<List<CharacterModel>> getListCharacters(String aditional) async {
    try {
      final data = await charactersDataSource.getListCharacters(aditional);
      List<CharacterModel> characters =
          data.map((character) => CharacterModel.fromJson(character)).toList();

      return characters;
    } on NotAcceptable {
      return Future.error('O servidor não pode produzir uma resposta!');
    } on Forbidden {
      return Future.error('Você não tem permissão!');
    } on Conflict {
      return Future.error(
          'A solicitação conflitou com os recursos do servidor!');
    } on NotFound {
      return Future.error(
          'Falha na requisição, pois o servidor não encontrou a rota!');
    } on Unauthorized {
      return Future.error('Você não está autenticado!');
    } on DataSourceError {
      return Future.error('Houve um erro ao carregar os dados!');
    }
  }

  @override
  Future<List<ComicNewModel>> getListComics(int id) async {
    try {
      final data = await charactersDataSource.getListComics(id);
      List<ComicNewModel> characters =
          data.map((comic) => ComicNewModel.fromJson(comic)).toList();

      return characters;
    } on NotAcceptable {
      return Future.error('O servidor não pode produzir uma resposta!');
    } on Forbidden {
      return Future.error('Você não tem permissão!');
    } on Conflict {
      return Future.error(
          'A solicitação conflitou com os recursos do servidor!');
    } on NotFound {
      return Future.error(
          'Falha na requisição, pois o servidor não encontrou a rota!');
    } on Unauthorized {
      return Future.error('Você não está autenticado!');
    } on DataSourceError {
      return Future.error('Houve um erro ao carregar os dados!');
    }
  }
}
