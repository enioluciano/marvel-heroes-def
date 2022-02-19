import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';
import 'package:project_test/app/pages/characters/presenter/controllers/home_controller.dart';

class SearchDialog extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 20,
            left: 8,
            right: 12,
            child: Card(
                child: Obx(
              () => _searchField(),
            )))
      ],
    );
  }

  Widget _searchField() {
    return TextFormField(
      autofocus: true,
      textInputAction: TextInputAction.search,
      controller: controller.search,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          suffixIcon: controller.text == ''
              ? null
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    controller.search.clear();
                    controller.changeText('');
                    controller.searchCharacters();
                  },
                ),
          prefixIcon: IconButton(
              onPressed: () {
                controller.search.clear();
                controller.changeText('');
                controller.searchCharacters();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: grey,
              ))),
      onChanged: (String search) {
        controller.changeText(search);
        controller.searchCharacters();
      },
      onFieldSubmitted: (String search) {
        Get.back(result: search);
      },
    );
  }
}
