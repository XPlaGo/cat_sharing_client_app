import 'dart:developer';

import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/payment.pbgrpc.dart';
import 'package:cat_sharing_client_app/generated/transaction.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:grpc/grpc.dart';
import "package:injectable/injectable.dart";

@injectable
class TransactionService {
  late final ClientChannel channel;
  late final TransactionServiceClient stub;

  TransactionService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.transactionService.host,
      port: appConfig.transactionService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = TransactionServiceClient(channel);
  }

  Future<ResponseStream<TransactionDataInfo>> getMyTransactions(String accountId) async {
    return stub.getMyTransactions(
      GetMyTransactionsRequest(accountId: accountId),
      options: await AuthService.getAuthCallOptions(),
    );
  }
}