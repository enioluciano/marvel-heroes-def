import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';
import 'package:project_test/app/pages/characters/ui/details_character/widgets/load_comics.dart';
import '../../presenter/controllers/details_character_controller.dart';

class DetailsCharacterPage extends GetView<DetailsCharacterController> {
  DetailsCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _body())),
    );
  }

  Widget _body() {
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                splashRadius: TEN,
                onPressed: Get.back,
                icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: white)),
          ),
          const SizedBox(height: TWENTY),
          _image(),
          const SizedBox(height: TWENTY),
          _description(),
        ],
      ),
    );
  }

  Widget _image() {
    return Center(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              '${controller.character!.thumbnail?.path}.${controller.character!.thumbnail?.extension}',
              height: 300,
              width: 300,
              fit: BoxFit.fill)),
    );
  }

  Widget _description() {
    return Container(
        height: Get.height * 0.8,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            )),
        child: Column(
          children: [
            _title(),
            const SizedBox(height: TEN),
            _descriptionBody(),
            const SizedBox(height: TWENTY),
            _comicTitle(),
            const SizedBox(height: TEN),
            _showImages(),
          ],
        ));
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${controller.character?.name}',
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.ios_share_sharp, color: primaryColor)),
      ],
    );
  }

  Widget _descriptionBody() {
    return Text(
        '${controller.character!.description != '' ? controller.character!.description : 'Sem descrição'}',
        style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
            fontSize: 16));
  }

  Widget _comicTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('História em quadrinho',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  Widget _showImages() {
    return Obx(() {
      switch (controller.status) {
        case Status.none:
          return Container(
            height: Get.height * 0.4,
            alignment: Alignment.center,
            child: Text(
              'Nenhum quadrinho encontrado!',
              style: TextStyle(color: Colors.grey[400]),
            ),
          );
        case Status.empty:
          return const LoadComics();
        case Status.notEmpty:
          return _comics();

        case Status.failed:
        default:
          return Container(
            height: Get.height * 0.4,
            alignment: Alignment.center,
            child: Text(
              'Houve um erro ao carregar os quadrinhos!',
              style: TextStyle(color: Colors.grey[400]),
            ),
          );
      }
    });
  }

  Widget _comics() {
    return SizedBox(
      height: 320,
      child: Obx(
        () => ListView.builder(
            itemCount: controller.comics.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ComicNewModel comic = controller.comics[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _imageComic(comic),
                    const SizedBox(height: TEN),
                    SizedBox(
                        width: 120,
                        child: Text('${comic.title}',
                            style: TextStyle(color: Colors.grey[600]))),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _imageComic(ComicNewModel comic) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
          '${comic.thumbnail?.path}.${comic.thumbnail?.extension}',
          height: 180,
          width: 130,
          fit: BoxFit.fill),
    );
  }
}
