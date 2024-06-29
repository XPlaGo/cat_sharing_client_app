import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/pages/replenish/replenish_page.dart';
import 'package:cat_sharing_client_app/pages/transactions_history/transaction_history_page.dart';
import 'package:cat_sharing_client_app/pages/transfer/transfer_page.dart';
import 'package:cat_sharing_client_app/services/payment_account_service.dart';
import 'package:cat_sharing_client_app/services/payment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:currency_formatter/currency_formatter.dart';

class MyPaymentAccountPage extends StatefulWidget {
  const MyPaymentAccountPage({super.key});

  @override
  State<StatefulWidget> createState() => MyPaymentAccountPageState();
}

class MyPaymentAccountPageState extends State<MyPaymentAccountPage> with AfterLayoutMixin<MyPaymentAccountPage> {

  AccountInfo? accountInfo;

  PaymentAccountService paymentAccountService = GetIt.instance<PaymentAccountService>();
  PaymentService paymentService = GetIt.instance<PaymentService>();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (goBack) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Profile", style: Theme.of(context).textTheme.titleMedium,)
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (goBack) {
      return RefreshIndicator(
        onRefresh: () async {
          await createOrGetMyPaymentAccount(context);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: CSSkeleton(
            containersColor: Theme.of(context).colorScheme.primaryContainer,
            enabled: accountInfo == null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getCard(context),
                  const SizedBox(height: 15),
                  getOperationsButtons(context),
                  const SizedBox(height: 15),
                  getHistoryButton(context),
                  const SizedBox(height: 40),
                  getCatCoinInfo(context),
                ],
              ),
            ),
          ),
        )
      );
    };
  }

  Widget getCatCoinInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Iconify(
          Uil.info_circle,
          size: 32,
          color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
        ),
        const SizedBox(height: 10),
        Text(
          "CatCoin is an in-app currency that allows you to buy virtual cats or rent them from their owners.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget getHistoryButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CSFlatButton(
            onPressed: (reset) async {
              if (accountInfo != null) {
                Navigator.of(context).pushNamed(
                    TransactionHistoryPage.pageRoute,
                    arguments: TransactionHistoryPageArguments(accountId: accountInfo!.id)
                ).then((value) => reset());
              }
            },
            text: "History",
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            prefixIcon: Iconify(
              Uil.history,
              size: 18,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
        )
      ],
    );
  }

  Widget getOperationsButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CSFlatButton(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: (reset) async {
              await replenish(context, reset);
            },
            text: "Replenish",
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            prefixIcon: Iconify(
              Uil.arrow_up,
              size: 24,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CSFlatButton(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: (reset) async {
              await transfer(context, reset);
            },
            text: "Send",
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            prefixIcon: Iconify(
              Uil.arrow_right,
              size: 24,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        )
      ],
    );
  }

  Future<void> transfer(BuildContext context, Function() reset) async {
    if (accountInfo != null) {
      Navigator.of(context)
          .pushNamed(TransferPage.pageRoute, arguments: TransferPageArguments(senderAccountInfo: accountInfo!))
          .then((value) => reset());
    }
  }

  Future<void> replenish(BuildContext context, Function() reset) async {
    if (accountInfo != null) {
      Navigator.of(context)
          .pushNamed(ReplenishPage.pageRoute, arguments: ReplenishPageArguments(senderAccountInfo: accountInfo!))
          .then((value) => reset());
    }
  }

  Widget getCard(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.BACK,
      speed: 200,
      flipOnTouch: true,
      front: getCardFront(context),
      back: getCardBack(context),
    );
  }

  String? getAmount() {

    if (accountInfo == null) return null;

    CurrencyFormat catCoinsSettings = const CurrencyFormat(
      code: 'cc',
      symbol: 'cc',
      symbolSide: SymbolSide.right,
      thousandSeparator: ' ',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );

    return CurrencyFormatter.format("${accountInfo?.amount.units}.${accountInfo?.amount.nanos}", catCoinsSettings);
  }

  Widget getCardFront(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        child: Stack(
          children: [
            const Skeleton.shade(
              child: Center(
                child: Image(
                  image: AssetImage("assets/card/cat-coins-card-bg.png"),
                  fit: BoxFit.contain,
                  opacity: AlwaysStoppedAnimation(0.5),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Account ID",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(0.5),
                                ),
                              ),
                              OverflowScrollableText(
                                value: accountInfo?.id ?? "",
                                textStyle: Theme.of(context).textTheme.titleLarge,
                                scrollShadowColor: Theme.of(context).colorScheme.primaryContainer,
                              ),
                            ],
                          )
                      ),
                      const SizedBox(width: 10),
                      Iconify(
                        Uil.info_circle,
                        size: 32,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  Widget getCardBack(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      child: Stack(
        children: [
          const Skeleton.shade(
            child: Center(
              child: Image(
                image: AssetImage("assets/card/cat-coins-card-bg.png"),
                fit: BoxFit.contain,
                opacity: AlwaysStoppedAnimation(0.5),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Balance",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                              ),
                            ),
                            OverflowScrollableText(
                              value: getAmount() ?? "",
                              textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              scrollShadowColor: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        )
                    ),
                    const SizedBox(width: 10),
                    Iconify(
                      Uil.info_circle,
                      size: 32,
                      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await createOrGetMyPaymentAccount(context);
  }

  Future<void> createOrGetMyPaymentAccount(BuildContext context) async {
    try {
      AccountInfo accountInfo = await paymentAccountService.createMyPaymentAccount();
      setState(() {
        this.accountInfo = accountInfo;
      });
    } on GrpcError catch (error) {
      if (error.code == Code.ALREADY_EXISTS.value) {
        await getMyPaymentAccount(context);
      } else {
        if (context.mounted) {
          showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
        }
      }
    }
  }

  Future<void> getMyPaymentAccount(BuildContext context) async {
    try {
      AccountInfo accountInfo = await paymentAccountService.getMyPaymentAccount();
      setState(() {
        this.accountInfo = accountInfo;
      });
    } on GrpcError catch (error) {
      if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
      }
    }
  }
}