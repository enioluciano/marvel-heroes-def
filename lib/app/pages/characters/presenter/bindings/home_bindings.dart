import 'package:dio/dio.dart';
import 'package:get/get.dart';
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
    final dio = Dio();
    Get.put<Dio>(dio, permanent: true);
    final data = Get.find<Dio>();

    Get.put<CharactersDataSource>(CharactersDataSourceImpl(
      dio: data,
      server: '',
    ));
    Get.put<CharactersRepository>(CharactersRepositoryImpl(
        charactersDataSource: Get.find<CharactersDataSource>()));

    Get.put<GetCharacters>(GetCharactersImpl(
        charactersRepository: Get.find<CharactersRepository>()));
    Get.put(HomeController());
  }
}
