import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test/app/core/routes/routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animationSize;

  RxDouble opacity = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1), () {
      opacity.value = 1;
    });
    //outra forma de animar
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 2500),
    // );

    // animationSize = Tween<double>(
    //   begin: 0,
    //   end: 300,
    // ).animate(CurvedAnimation(
    //     parent: animationController!, curve: Curves.easeInOutBack));

    // animationController!.forward();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.LOGIN);
      // animationController!.dispose();
    });
  }
}
