import 'package:cat_sharing_client_app/config/grpc.config.dart';
import 'package:global_configuration/global_configuration.dart';

class AppConfig {
  late final GrpcServiceConfig authService;
  late final GrpcServiceConfig catService;
  late final GrpcServiceConfig paymentService;
  late final GrpcServiceConfig transactionService;
  late final GrpcServiceConfig tradeService;

  AppConfig.fromConfiguration(GlobalConfiguration configuration)
    : authService = GrpcServiceConfig.fromMap(configuration.get("authService") as Map<String, dynamic>),
      catService = GrpcServiceConfig.fromMap(configuration.get("catService") as Map<String, dynamic>),
      paymentService = GrpcServiceConfig.fromMap(configuration.get("paymentService") as Map<String, dynamic>),
      transactionService = GrpcServiceConfig.fromMap(configuration.get("transactionService") as Map<String, dynamic>),
      tradeService = GrpcServiceConfig.fromMap(configuration.get("tradeService") as Map<String, dynamic>);
}