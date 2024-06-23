import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:cat_sharing_client_app/config/app.config.dart';

@module
abstract class ConfigModule {
  @singleton
  @preResolve
  Future<AppConfig> get appSettings async {
    AppConfig settings = AppConfig.fromConfiguration(GlobalConfiguration());
    return settings;
  }
}