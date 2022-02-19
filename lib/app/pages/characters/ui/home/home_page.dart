import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';
import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/ui/home/widgets/load_home_page.dart';
import 'package:project_test/app/pages/characters/ui/home/widgets/search_dialog.dart';
import '../../presenter/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scroll,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: FIFTEEN),
              _customAppBar(context),
              const SizedBox(height: TWENTY_FIVE),
              _title(),
              const SizedBox(height: TWENTY),
              Obx(() {
                switch (controller.status) {
                  case Status.none:
                    return Container(
                      height: Get.height * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        'Nenhum personagem encontrado!',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    );
                  case Status.empty:
                    return const LoadHomePage();
                  case Status.notEmpty:
                    return _gridView();

                  case Status.failed:
                  default:
                    return Container(
                      height: Get.height * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        'Houve um erro ao carregar os personagens!',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/images/marvel.jpeg',
            width: 90,
            fit: BoxFit.contain,
          ),
        ),
        IconButton(
            onPressed: () async {
              final result = await showDialog(
                  context: context, builder: (_) => SearchDialog());

              if (result != null) {
                controller.search.text = result;
                controller.searchCharacters();
              }
            },
            icon: Icon(
              Icons.search_sharp,
              size: 30,
              color: Colors.grey[600],
            )),
      ],
    );
  }

  Widget _title() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Lista de Personagem',
          style: TextStyle(
              fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
        ));
  }

  Widget _gridView() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          maxCrossAxisExtent: 200,
        ),
        itemCount: controller.charactersFilter.length,
        itemBuilder: (context, index) {
          controller.setCont(controller.charactersFilter.length);
          CharacterModel character = controller.charactersFilter[index];

          return _item(character);
        });
  }

  Widget _item(CharacterModel character) {
    return GestureDetector(
      onTap: () {
        controller.navigationDetailsCharacter(character);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: primaryColor,
        child: Container(
          // height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [secondColorGradient, primaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image(character),
              const SizedBox(height: TEN),
              _titleName(character),
              const SizedBox(width: FIVE),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(CharacterModel character) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: Image.network(
        '${character.thumbnail?.path}.${character.thumbnail?.extension}',
        height: 130,
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _titleName(CharacterModel character) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(
            character.name!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: white),
          ),
        ));
  }
}
