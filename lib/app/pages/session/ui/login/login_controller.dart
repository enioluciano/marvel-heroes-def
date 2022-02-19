import 'package:get/get.dart';
import 'package:project_test/app/core/routes/routes.dart';

class LoginController extends GetxController {
  void navigationForHome() {
    Get.offAllNamed(Routes.HOME);
  }
}
