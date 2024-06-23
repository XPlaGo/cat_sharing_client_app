import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:cat_sharing_client_app/pages/offer_page/offer_page.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../common/money_tools.dart';

class SaleOfferCard extends StatefulWidget {

  final String infoId;
  final Function() onPop;

  const SaleOfferCard({
    super.key,
    required this.infoId,
    required this.onPop,
  });

  @override
  State<StatefulWidget> createState() => SaleOfferCardState();
}

class SaleOfferCardState extends State<SaleOfferCard> with AfterLayoutMixin<SaleOfferCard> {

  TradeService tradeService = GetIt.instance<TradeService>();
  SaleOfferFullInfo? info;

  @override
  Widget build(BuildContext context) {
    return CSSkeleton(
      enabled: info == null,
      child: CSFlatButton(
          onPressed: (reset) async {
            if (info != null) {
              Navigator.of(context).pushNamed(OfferPage.pageRoute, arguments: OfferPageArguments(offerId: info?.id ?? ""))
                  .then((value) {
                    reset();
                    widget.onPop();
                  });
            }
          },
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 128),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 0),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MoneyTools.convertToString(info?.price ?? Money(), compact: true),
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondary,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Row(
                          children: [
                            const SizedBox(width: 128),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  info?.cat.name ?? "",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(DateFormat("d MMMM y").format(info?.cat.birthday.toDateTime() ?? DateTime.now())),
                              ],
                            ),
                            const SizedBox(width: 16),
                            const Spacer(),
                          ],
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Skeleton.shade(
                    child: SizedBox(
                        height: 128,
                        width: 128,
                        child: Image(
                            image: AssetImage(
                                "assets/avatar/${info?.cat.avatarId ?? "avatar1"}.png"))),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }

  Future<void> initInfo(BuildContext context) async {
    try {
      if (widget.infoId.isNotEmpty) {
        final infoData = await tradeService.getSaleFullOfferById(widget.infoId);
        if (context.mounted) {
          setState(() {
            info = infoData;
          });
        }
      }
    } on GrpcError catch (error) {
      showNotificationMessage(context, "${error.message}", status: NotificationMessageStatus.error);
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initInfo(context);
  }
}