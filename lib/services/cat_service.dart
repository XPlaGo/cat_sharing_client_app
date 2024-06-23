import 'dart:developer';

import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/cat.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatService {
  late final ClientChannel channel;
  late final CatServiceClient stub;

  CatService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.catService.host,
      port: appConfig.catService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = CatServiceClient(channel);
  }

  Future<CatInfo> getCat(GetCatRequest request) async {
    return await stub.getCat(
      request,
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<CatInfo> createCat(CreateCatRequest request) async {
    return await stub.createCat(
      request,
      options: await AuthService.getAuthCallOptions(),
    );
  }
}