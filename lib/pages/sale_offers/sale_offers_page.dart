import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/pages/sale_offers/sale_offer_card.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:unicons/unicons.dart';

import '../../components/inputs/text_input.dart';

class SaleOffersPage extends StatefulWidget {

  static String pageRoute = "sale_offers";

  const SaleOffersPage({super.key});

  @override
  State<StatefulWidget> createState() => SaleOffersPageState();
}

class SaleOffersPageState extends State<SaleOffersPage> with AfterLayoutMixin<SaleOffersPage> {

  TradeService tradeService = GetIt.instance<TradeService>();

  List<String> offersIds = [];
  List<String> offersLoadingIds = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (goBack) {
      return  Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Buy", style: Theme.of(context).textTheme.titleMedium,)
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (goBack) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: CSTextInput(
                  placeholder: "Search in cats",
                  prefixIcon: Icon(
                    UniconsLine.search,
                    size: 24,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ),
              Expanded(
                child: offersIds.isNotEmpty ? ScrollShadow(
                  color: Theme.of(context).colorScheme.background,
                  size: 32,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await fetchSaleOffers(context);
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: offersIds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SaleOfferCard(
                            infoId: offersIds[index],
                            onPop: () => fetchSaleOffers(context),
                          ),
                        );
                      },
                    ),
                  ),
                ) : loading ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SaleOfferCard(
                        infoId: "",
                        onPop: () => fetchSaleOffers(context),
                      ),
                    );
                  },
                ) : const Center(
                  child: Text("No offers"),
                ),
              ),
            ],
          )
      );
    };
  }

  Future<void> fetchSaleOffers(BuildContext context) async {
    log("fetch");
    try {
      setState(() {
        loading = true;
        //offersIds = [];
      });

      setState(() {
        offersIds = [];
      });

      final stream = await tradeService.getProposedSaleOffers();

      stream.listen((id) {
        setState(() {
          offersIds.add(id.value);
        });
      },
      onDone: () {
        setState(() {
          loading = false;
          // offersIds = offersLoadingIds.sublist(0);
          // offersLoadingIds = [];
        });
      });
    } on GrpcError catch (error) {
      showNotificationMessage(context, "${error.message}", status: NotificationMessageStatus.error);
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await fetchSaleOffers(context);
  }
}