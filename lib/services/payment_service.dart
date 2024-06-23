import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/wrappers.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:grpc/grpc.dart';
import "package:injectable/injectable.dart";

@injectable
class PaymentService {
  late final ClientChannel channel;
  late final PaymentServiceClient stub;

  PaymentService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.paymentService.host,
      port: appConfig.paymentService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = PaymentServiceClient(channel);
  }

  Future<ResponseStream<TransactionInfo>> transfer(TransferRequest request) async {
    return stub.transfer(
      request,
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<void> rollback(String transactionId) async {
    StringValue id = StringValue();
    id.value = transactionId;
    await stub.rollback(
      id,
      options: await AuthService.getAuthCallOptions(),
    );
  }
}