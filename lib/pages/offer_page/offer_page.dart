import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/common/money_tools.dart';
import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/modals/buy_modal.dart';
import 'package:cat_sharing_client_app/components/modals/create_sale_offer_bottom_sheet.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:cat_sharing_client_app/services/cat_service.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OfferPageArguments {


  final String offerId;

  OfferPageArguments({
    required this.offerId
  });
}

class OfferPage extends StatefulWidget {
  static const String pageRoute = "/offer_page";

  const OfferPage({super.key});

  @override
  State<StatefulWidget> createState() => OfferPageState();
}

class OfferPageState extends State<OfferPage> with AfterLayoutMixin<OfferPage> {

  TradeService tradeService = GetIt.instance<TradeService>();

  SaleOfferFullInfo? saleOfferFullInfo;

  ValueNotifier<BuyModalStatus?> buyStatusNotifier = ValueNotifier(null);
  ValueNotifier<String?> buyRejectionReasonNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      floatingButton: getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      getAppBarChild: getAppBarChild,
      getChild: getChild,
    );
  }

  Widget getFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: getSaleOfferButton(context),
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: CSSkeleton(
          containersColor: Theme.of(context).colorScheme.primaryContainer,
          enabled: saleOfferFullInfo == null,
          child: Row(
            children: [Text(
              saleOfferFullInfo?.cat.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            )],
          ),
        )
    );
  }

  Widget getChild(Function() goBack) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: CSSkeleton(
        enabled: saleOfferFullInfo == null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeleton.shade(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("assets/avatar/${saleOfferFullInfo?.cat.avatarId ?? "avatar1"}.png"))
              ),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getInfoPanel(context),
                const SizedBox(height: 16),
                getCommentPanel(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getInfoPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: OverflowScrollableText(
                    value: saleOfferFullInfo?.cat.name ?? "",
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Divider(color: Theme.of(context).dividerColor.withOpacity(0.1),),
                Row(
                  children: [
                    const Text("Birthday:"),
                    const Spacer(),
                    Text(saleOfferFullInfo?.cat.birthday != null ? DateFormat("d MMMM y").format(saleOfferFullInfo?.cat.birthday.toDateTime() ?? DateTime.now()) : ""),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget getCommentPanel(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: OverflowScrollableText(
                      value: "Comment",
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      Text(saleOfferFullInfo?.comment == null || saleOfferFullInfo!.comment.isEmpty ? "No comment" : saleOfferFullInfo!.comment),
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  Widget getSaleOfferButton(BuildContext context) {
    return CSSkeleton(
      enabled: saleOfferFullInfo == null,
      containersColor: Theme.of(context).colorScheme.primaryContainer,
      child: CSFlatButton(
        showLoader: false,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: (reset) async {
          if (saleOfferFullInfo != null) {
            OfferPageArguments arguments = ModalRoute.of(context)!.settings.arguments as OfferPageArguments;
            await buy(context, arguments.offerId);
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Buy",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary
                ),
              ),
            ),
            Text(
              MoneyTools.convertToString(saleOfferFullInfo?.price ?? Money()),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Iconify(
                    Uil.money_bill,
                    size: 24,
                    color: Theme.of(context).colorScheme.onSecondary,
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget getPriceBox(BuildContext context, Money money) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            MoneyTools.convertToString(money, compact: true),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground
            ),
          ),
        ],
      )
    );
  }

  Future<void> buy(BuildContext context, String saleOfferId) async {
    try {
      final stream = await tradeService.buy(saleOfferId);

      showBuyModal(
          context,
          buyStatusNotifier,
          buyRejectionReasonNotifier,
          saleOfferFullInfo: saleOfferFullInfo!,
          onClose: () {
            buyStatusNotifier.value = null;
            Navigator.of(context).pop();
          },
          onCancel: () {
            stream.cancel();
            buyStatusNotifier.value = null;
          }
      );

      stream.listen((info) {
        switch (info.status) {
          case "PENDING":
            buyStatusNotifier.value = BuyModalStatus.pending;
            break;
          case "CONFIRMED":
            buyStatusNotifier.value = BuyModalStatus.confirmed;
            break;
          case "REJECTED":
            buyStatusNotifier.value = BuyModalStatus.rejected;
            buyRejectionReasonNotifier.value = info.reason;
            break;
        }
      });
    } on GrpcError catch (error) {
      showNotificationMessage(context, "${error.message}", status: NotificationMessageStatus.error);
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initOfferInfo(context);
  }

  Future<void> initOfferInfo(BuildContext context) async {
    try {
      OfferPageArguments arguments = ModalRoute.of(context)!.settings.arguments as OfferPageArguments;
      final result = await tradeService.getSaleFullOfferById(arguments.offerId);
      if (context.mounted) {
        setState(() {
          saleOfferFullInfo = result;
        });
      }
    } on GrpcError catch (error) {
      if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
      }
    }
  }
}