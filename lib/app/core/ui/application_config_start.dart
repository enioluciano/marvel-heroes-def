import 'package:project_test/app/core/helpers/environments.dart';

class ApplicationConfigStart {
  Future<void> configureApp() async {
    await _loadEnvs();
  }

  Future<void> _loadEnvs() async => Environments.loadEnvs();
}
