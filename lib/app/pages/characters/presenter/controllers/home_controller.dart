import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test/app/core/routes/routes.dart';
import 'package:project_test/app/core/util/notification.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';

enum Status {
  none,
  empty,
  notEmpty,
  failed,
}

class HomeController extends GetxController {
  ScrollController scroll = ScrollController();
  final search = TextEditingController();

  final RxString _text = ''.obs;
  String get text => _text.value;
  changeText(newText) => _text.value = newText;

  final Rx<Status> _status = Status.empty.obs;
  Status get status => _status.value;

  final RxList<CharacterModel> _characters = <CharacterModel>[].obs;
  List<CharacterModel> get characters => _characters;
  void addCharacter(CharacterModel character) => _characters.add(character);

  final RxList<CharacterModel> _charactersFilter = <CharacterModel>[].obs;
  List<CharacterModel> get charactersFilter => _charactersFilter;

  final RxString _aditional = ''.obs;
  String get aditional => _aditional.value;

  final RxInt _cont = 0.obs;
  int get cont => _cont.value;
  void setCont(newValue) => _cont.value = newValue;
  void addNumberCharacterInCont() {
    _cont.value += 10;
  }

  final RxBool _openSearch = false.obs;
  bool get openSearch => _openSearch.value;
  void setOpenSearch() => _openSearch.value = !_openSearch.value;

  Future<void> getLisCharacters() async {
    try {
      final data = Get.find<GetCharacters>();
      _characters.value = await data('');
      _charactersFilter.value = _characters;

      if (characters.isEmpty) _status.value = Status.none;
      if (characters.isNotEmpty) _status.value = Status.notEmpty;
    } catch (e) {
      _status.value = Status.failed;
    }
  }

  Future<void> getAddCharactersInList() async {
    if (cont <= 100) {
      BotToast.showLoading();
      try {
        final data = Get.find<GetCharacters>();
        _characters.value = await data('&limit=$cont');
        _charactersFilter.value = _characters;

        if (characters.isEmpty) _status.value = Status.none;
        if (characters.isNotEmpty) _status.value = Status.notEmpty;

        BotToast.closeAllLoading();
      } catch (e) {
        BotToast.closeAllLoading();
        AppNotificationToast.toastAlerta('Erro ao carregar a lista!', 3);
      }
    } else {
      AppNotificationToast.toastAlerta(
          'não há mais Personagens para serem carregados!', 3);
    }
  }

  void searchCharacters() {
    if (search.text.isEmpty) {
      _charactersFilter.value = _characters;
      _status.value = Status.notEmpty;
    } else {
      _charactersFilter.value = _characters
          .where((character) =>
              character.name!.toLowerCase().contains(search.text))
          .toList();
    }

    if (_charactersFilter.isEmpty) _status.value = Status.none;
    if (_charactersFilter.isNotEmpty) _status.value = Status.notEmpty;
  }

  void scrollable() {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        addNumberCharacterInCont();
        getAddCharactersInList();
      }
    });
  }

  void navigationDetailsCharacter(CharacterModel character) {
    Get.toNamed(Routes.DETAILS_CHARACTER, arguments: character);
  }

  @override
  void onInit() {
    super.onInit();
    scrollable();
  }

  @override
  void onReady() {
    super.onReady();
    getLisCharacters();
  }

  @override
  void onClose() {
    super.onClose();
    scroll.dispose();
  }
}
