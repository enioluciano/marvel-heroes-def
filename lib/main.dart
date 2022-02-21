import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test/app/core/routes/app_routes.dart';
import 'package:project_test/app/core/routes/routes.dart';
import 'package:project_test/app/core/ui/application_config_start.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';

void main() async {
  await ApplicationConfigStart().configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: primaryColor,
              ),
        ),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Project Test',
        initialRoute: Routes.SPLASH,
        getPages: RoutesPages.routes);
  }
}
