import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';

abstract class CharactersRepository {
  Future<List<CharacterModel>> getListCharacters(String aditional);
  Future<List<ComicNewModel>> getListComics(int id);
}
