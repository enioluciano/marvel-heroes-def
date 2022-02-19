import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            opacity: controller.opacity.value,
            duration: const Duration(seconds: 2),
            child: Image.asset('assets/images/marvel.jpeg',
                width: 140, height: 80),
          ),
        ),
      ),
    );

    // Scaffold(
    //     backgroundColor: primaryColor,
    //     body: AnimatedBuilder(
    //         animation: controller.animationSize!,
    //         builder: (context, widget) {
    //           return Center(
    //             child: Container(
    //               constraints: BoxConstraints(minHeight: 0),
    //               width: controller.animationSize!.value,
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //                 child: Image.asset('assets/images/marvel.jpeg',
    //                     width: 140, height: 80),
    //               ),
    //             ),
    //           );
    //         }));
    // Scaffold(
    //   backgroundColor: primaryColor,
    //   body: Center(
    //     child: Image.asset('assets/images/marvel.jpeg', width: 140, height: 80),
    //   ),
    // );
  }
}
