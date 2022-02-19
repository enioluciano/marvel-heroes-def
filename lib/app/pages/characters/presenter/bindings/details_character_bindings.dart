import 'package:get/get.dart';
import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/domain/usecases/get_comics_usecase_impl.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';
import '../controllers/details_character_controller.dart';

class DetailsCharacterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetComics>(
        GetComicsImpl(charactersRepository: Get.find<CharactersRepository>()));
    Get.put(DetailsCharacterController());
  }
}
