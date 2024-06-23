import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/cat.pbgrpc.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/empty.pb.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:cat_sharing_client_app/services/storage_service.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OwnerService {
  late final ClientChannel channel;
  late final OwnerServiceClient stub;

  OwnerService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.catService.host,
      port: appConfig.catService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = OwnerServiceClient(channel);
  }

  Future<OwnerInfo> getMyOwner() async {
    OwnerInfo ownerInfo = await stub.getMyOwner(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    );
    await StorageService.saveGeneratedMessage("myOwner", ownerInfo);
    return ownerInfo;
  }

  Future<OwnerInfo> createMyOwner() async {
    OwnerInfo ownerInfo = await stub.createMyOwner(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    );
    await StorageService.saveGeneratedMessage("myOwner", ownerInfo);
    return ownerInfo;
  }

  Future<bool> myOwnerExists() async {
    return (await stub.myOwnerExists(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    )).value;
  }
}