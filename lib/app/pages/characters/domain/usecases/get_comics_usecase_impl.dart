import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';

class GetComicsImpl implements GetComics {
  CharactersRepository charactersRepository;
  GetComicsImpl({required this.charactersRepository});
  @override
  Future<List<ComicNewModel>> call(int id) async {
    final data = charactersRepository.getListComics(id);

    return data;
  }
}
