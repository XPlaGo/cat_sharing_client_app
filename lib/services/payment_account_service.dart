import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/empty.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:grpc/grpc.dart';
import "package:injectable/injectable.dart";

@injectable
class PaymentAccountService {
  late final ClientChannel channel;
  late final PaymentAccountServiceClient stub;

  PaymentAccountService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.paymentService.host,
      port: appConfig.paymentService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = PaymentAccountServiceClient(channel);
  }

  Future<AccountInfo> getMyPaymentAccount() async {
    return await stub.getMyPaymentAccount(
        Empty(),
        options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<AccountsInfo> getMyPaymentAccounts() async {
    return await stub.getMyPaymentAccounts(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<AccountInfo> createMyPaymentAccount() async {
    return await stub.createMyPaymentAccount(
        Empty(),
        options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<bool> myAccountExists() async {
    return (await stub.myAccountExists(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    )).value;
  }

  Future<PublicAccountInfo> getPaymentAccountByEmail(String email) async {
    return await stub.getPaymentAccountByEmail(
      GetAccountByEmailRequest(email: email),
      options: await AuthService.getAuthCallOptions(),
    );
  }
}