import 'package:get/get.dart';
import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/core/rest_client/dio_rest_client.dart';
import 'package:project_test/app/core/rest_client/rest_client.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<Logger>(LoggerImpl(), permanent: true);
    Get.put<RestClient>(DioRestClient(), permanent: true);
  }
}
