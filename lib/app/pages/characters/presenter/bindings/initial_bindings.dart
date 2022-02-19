import 'package:get/get.dart';
import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/pages/characters/presenter/controllers/initial_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(InitialController(), permanent: true);
    Get.put<Logger>(LoggerImpl(), permanent: true);
  }
}
