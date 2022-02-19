import 'package:get/get.dart';
import 'package:project_test/app/core/routes/routes.dart';
import 'package:project_test/app/pages/characters/presenter/bindings/details_character_bindings.dart';
import 'package:project_test/app/pages/characters/presenter/bindings/home_bindings.dart';
import 'package:project_test/app/pages/characters/presenter/bindings/initial_bindings.dart';
import 'package:project_test/app/pages/characters/ui/details_character/details_character_page.dart';
import 'package:project_test/app/pages/characters/ui/home/home_page.dart';
import 'package:project_test/app/pages/session/ui/login/login_bindings.dart';
import 'package:project_test/app/pages/session/ui/login/login_page.dart';
import 'package:project_test/app/pages/session/ui/splash/splash_bindings.dart';
import 'package:project_test/app/pages/session/ui/splash/splash_page.dart';

class RoutesPages {
  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        transition: Transition.fadeIn,
        bindings: [InitialBindings(), SplashBindings()]),
    GetPage(
        name: Routes.LOGIN,
        transition: Transition.fadeIn,
        page: () => const LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.DETAILS_CHARACTER,
        page: () => DetailsCharacterPage(),
        binding: DetailsCharacterBindings()),
  ];
}
