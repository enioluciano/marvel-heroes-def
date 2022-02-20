import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/core/rest_client/dio_rest_client.dart';
import 'package:project_test/app/core/rest_client/rest_client.dart';
import 'package:project_test/app/pages/characters/data/datasource/remote/characters_datasource_impl.dart';
import 'package:project_test/app/pages/characters/domain/infra/characters_repository.dart';
import 'package:project_test/app/pages/characters/domain/usecases/get_characters_usecase_impl.dart';
import 'package:project_test/app/pages/characters/infra/datasources/characters_datasource.dart';
import 'package:project_test/app/pages/characters/infra/repository/characters_repository_impl.dart';
import 'package:project_test/app/pages/characters/presenter/usecases/characters_usecase.dart';
import '../controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CharactersDataSource>(CharactersDataSourceImpl(
        restClient: Get.put<RestClient>(DioRestClient()),
        log: Get.find<Logger>()));
    Get.put<CharactersRepository>(CharactersRepositoryImpl(
        charactersDataSource: Get.find<CharactersDataSource>(),
        log: Get.find<Logger>()));

    Get.put<GetCharacters>(GetCharactersImpl(
        charactersRepository: Get.find<CharactersRepository>()));
    Get.put(HomeController());
  }
}
