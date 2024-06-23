import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/empty.pb.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/wrappers.pb.dart';
import 'package:cat_sharing_client_app/generated/trade.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import "package:injectable/injectable.dart";

@injectable
class TradeService {
  late final ClientChannel channel;
  late final SaleOfferServiceClient stub;

  TradeService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.tradeService.host,
      port: appConfig.tradeService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure(),),
    );
    stub = SaleOfferServiceClient(channel);
  }

  Future<SaleOfferInfo> createSaleOffer(CreateSaleOfferRequest request) async {
    return await stub.createSaleOffer(
      request,
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<SaleOfferInfo> getSaleOfferById(String id) async {
    return await stub.getSaleOfferById(
      StringValue(value: id),
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<SaleOfferFullInfo> getSaleFullOfferById(String id) async {
    return await stub.getSaleFullOfferById(
      StringValue(value: id),
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<SaleOfferInfo> getSaleOfferByCatId(int catId) async {
    Int64Value idWrapper = Int64Value();
    idWrapper.value = Int64(catId);
    return await stub.getSaleOfferByCatId(
      idWrapper,
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<ResponseStream<StringValue>> getProposedSaleOffers() async {
    return stub.getSaleOffersIds(
      Empty(),
      options: await AuthService.getAuthCallOptions(),
    );
  }

  Future<ResponseStream<BuyTransactionInfo>> buy(String saleOfferId) async {
    return stub.buy(
        BuyRequest(saleOfferId: saleOfferId),
      options: await AuthService.getAuthCallOptions(),
    );
  }
}