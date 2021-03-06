import 'package:get/get.dart';
import 'package:project_test/app/core/ui/widgets/notification.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';

enum Status {
  none,
  empty,
  notEmpty,
  failed,
}

class DetailsCharacterController extends GetxController {
  CharacterModel? character = CharacterModel();

  final Rx<Status> _status = Status.empty.obs;
  Status get status => _status.value;

  final RxList<ComicNewModel> _comics = <ComicNewModel>[].obs;
  List<ComicNewModel> get comics => _comics;
  void addComic(ComicNewModel comic) => _comics.add(comic);

  Future<void> getListComics() async {
    try {
      final data = Get.find<GetComics>();
      _comics.value = await data(character!.id!);

      if (_comics.isEmpty) _status.value = Status.none;
      if (_comics.isNotEmpty) _status.value = Status.notEmpty;
    } catch (err) {
      if (err is GetListComicsTimeOutException) {
        AppNotificationToast.toastAlerta(
            'Tempo de conexão limite encerrada!', 3);
      } else if (err is GetListComicsUnauthorizedException) {
        AppNotificationToast.toastAlerta('Não autorizado', 3);
      } else if (err is GetListComicsForbiddenException) {
        AppNotificationToast.toastAlerta('Não autorizado', 3);
      } else if (err is Failure) {
        AppNotificationToast.toastAlerta(
            'Houve um erro ao carregar a lista', 3);
      } else {
        AppNotificationToast.toastAlerta(err.toString(), 3);
      }
      _status.value = Status.failed;
    }
  }

  @override
  void onInit() {
    super.onInit();
    character = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    getListComics();
  }
}
