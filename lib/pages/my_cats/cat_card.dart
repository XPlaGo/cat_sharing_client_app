import 'dart:async';

import 'package:cat_sharing_client_app/common/money_tools.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:cat_sharing_client_app/pages/my_cat/my_cat_page.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/services/cat_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CatCard extends StatefulWidget {
  final int catId;

  const CatCard({super.key, required this.catId});

  @override
  State<StatefulWidget> createState() => CatCardState();
}

class CatCardState extends State<CatCard> with AfterLayoutMixin<CatCard> {
  CatService catService = GetIt.instance<CatService>();
  TradeService tradeService = GetIt.instance<TradeService>();

  CatInfo? catInfo;
  final key = GlobalKey();

  SaleOfferInfo? saleOfferInfo;
  bool isSaleOfferLoading = false;

  @override
  Widget build(BuildContext context) {
    return CSSkeleton(
        enabled: catInfo == null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CSFlatButton(
              onPressed: getCatCardPressHandler(context),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Skeleton.shade(
                    child: SizedBox(
                        height: 64,
                        width: 64,
                        child: Image(
                            image: AssetImage(
                                "assets/avatar/${catInfo?.avatarId ?? "avatar1"}.png"))),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catInfo?.name ?? "",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(catInfo?.birthday != null
                          ? DateFormat("d MMMM y")
                              .format(catInfo!.birthday.toDateTime())
                          : ""),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Spacer(),
                  getCatOffersPanels(context),
                ],
              )),
        ));
  }

  Widget getCatOffersPanels(BuildContext context) {
    return CSSkeleton(
      enabled: saleOfferInfo == null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          saleOfferInfo != null
              ? Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              MoneyTools.convertToString(saleOfferInfo!.price, compact: true),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
              : const SizedBox(),
          saleOfferInfo != null
              ? Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              MoneyTools.convertToString(saleOfferInfo!.price, compact: true),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> Function(void Function()) getCatCardPressHandler(
      BuildContext context) {
    return (reset) async {
      Navigator.of(context)
          .pushNamed("/my_cat",
              arguments: MyCatPageArguments(catId: widget.catId))
          .then((value) => reset());
    };
  }

  Future<void> initCatSaleOffer(BuildContext context) async {
    try {
      if (catInfo != null) {
        setState(() {
          isSaleOfferLoading = true;
        });
        SaleOfferInfo result =
            await tradeService.getSaleOfferByCatId(widget.catId);
        setState(() {
          saleOfferInfo = result;
          isSaleOfferLoading = false;
        });
      }
    } on GrpcError catch (error) {
      if (error.code == Code.NOT_FOUND.value) {
        setState(() {
          isSaleOfferLoading = false;
        });
      } else if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error",
            status: NotificationMessageStatus.error);
      }
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initCatInfo(context);
    await initCatSaleOffer(context);
  }

  Future<void> initCatInfo(BuildContext context) async {
    try {
      CatInfo result =
          await catService.getCat(GetCatRequest(id: Int64(widget.catId)));
      if (context.mounted) {
        setState(() {
          catInfo = result;
        });
      }
    } on GrpcError catch (error) {
      if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error",
            status: NotificationMessageStatus.error);
      }
    }
  }
}
