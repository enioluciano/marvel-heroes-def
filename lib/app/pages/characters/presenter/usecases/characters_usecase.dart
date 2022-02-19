import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';

abstract class GetCharacters {
  Future<List<CharacterModel>> call(String aditional);
}

abstract class GetComics {
  Future<List<ComicNewModel>> call(int id);
}
