import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';

class GetCharactersImpl implements GetCharacters {
  CharactersRepository charactersRepository;
  GetCharactersImpl({required this.charactersRepository});
  @override
  Future<List<CharacterModel>> call(String aditional) async {
    final data = charactersRepository.getListCharacters(aditional);

    return data;
  }
}
