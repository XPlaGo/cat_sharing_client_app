import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/transaction.pb.dart';
import 'package:cat_sharing_client_app/services/payment_service.dart';
import 'package:cat_sharing_client_app/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';

class TransactionHistoryPageArguments {
  final String accountId;

  TransactionHistoryPageArguments({required this.accountId});
}

class TransactionHistoryPage extends StatefulWidget {
  static String pageRoute = "transactionHistory";


  const TransactionHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => TransactionHistoryPageState();
}

class TransactionHistoryPageState extends State<TransactionHistoryPage> with AfterLayoutMixin<TransactionHistoryPage> {

  TransactionService transactionService = GetIt.instance<TransactionService>();
  PaymentService paymentService = GetIt.instance<PaymentService>();

  List<TransactionDataInfo> transactions = [];

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (reset) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Transaction history", style: Theme.of(context).textTheme.titleMedium,)
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (reset) {
      return CSSkeleton(
        enabled: transactions.isEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ScrollShadow(
            color: Theme.of(context).colorScheme.background,
            size: 32,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                String previousDate = index > 0
                    ? DateFormat('dd MMM yyyy').format(transactions[index - 1].modified.toDateTime())
                    : '';
                String date = DateFormat('dd MMM yyyy').format(transactions[index].modified.toDateTime());
                return getTransactionItem(context, transactions[index], date != previousDate);
              },
            ),
          ),
        ),
      );
    };
  }

  Widget getTransactionItem(BuildContext context, TransactionDataInfo transactionDataInfo, bool dateHeader) {
    TransactionHistoryPageArguments arguments = ModalRoute.of(context)!.settings.arguments as TransactionHistoryPageArguments;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          dateHeader ?
            getDateHeader(context, transactionDataInfo.modified.toDateTime())
            : const SizedBox(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CSFlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  onPressed: (reset) async {
                    await rollbackTransaction(context, transactionDataInfo.id);
                  },
                  child: transactionDataInfo.senderAccountId == arguments.accountId ?
                  getOutcomeTransactionItem(context, transactionDataInfo) :
                  getIncomeTransactionItem(context, transactionDataInfo),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getDateHeader(BuildContext context, DateTime dateTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
                DateFormat('dd MMM yyyy').format(dateTime),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        )
      ],
    );
  }

  Widget getIncomeTransactionItem(BuildContext context, TransactionDataInfo transactionDataInfo) {

    String iconData = Uil.spin;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        iconData = Uil.arrow_down;
        break;
      case "REJECTED":
        iconData = Uil.multiply;
      case "ROLLBACK":
        iconData = Uil.redo;
    }

    Color transactionColor = Theme.of(context).colorScheme.primaryContainer;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        transactionColor = Theme.of(context).colorScheme.tertiary;
        break;
      case "REJECTED":
        transactionColor = Theme.of(context).colorScheme.error;
    }

    Color onTransactionColor = Theme.of(context).colorScheme.onBackground;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        onTransactionColor = Theme.of(context).colorScheme.onTertiary;
        break;
      case "REJECTED":
        onTransactionColor = Theme.of(context).colorScheme.onError;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: transactionColor,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Iconify(
              iconData,
              size: 24,
              color: onTransactionColor,
            )
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OverflowScrollableText(
            value: transactionDataInfo.senderAccountId,
            scrollShadowColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: transactionColor,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            "+${getAmount(transactionDataInfo.amount)} cc",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: onTransactionColor
            ),
          ),
        )
      ],
    );
  }

  String getAmount(Money money) {
    return "${money.units}.${money.nanos}";
  }

  Widget getOutcomeTransactionItem(BuildContext context, TransactionDataInfo transactionDataInfo) {

    String iconData = Uil.spin;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        iconData = Uil.arrow_up;
        break;
      case "REJECTED":
        iconData = Uil.multiply;
      case "ROLLBACK":
        iconData = Uil.redo;
    }

    Color transactionColor = Theme.of(context).colorScheme.primaryContainer;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        transactionColor = Theme.of(context).colorScheme.primaryContainer;
        break;
      case "REJECTED":
        transactionColor = Theme.of(context).colorScheme.error;
    }

    Color onTransactionColor = Theme.of(context).colorScheme.onBackground;
    switch (transactionDataInfo.status) {
      case "SUCCESS":
        onTransactionColor = Theme.of(context).colorScheme.onBackground;
        break;
      case "REJECTED":
        onTransactionColor = Theme.of(context).colorScheme.onError;
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              color: transactionColor,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Iconify(
            iconData,
            size: 24,
            color: onTransactionColor,
          )
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OverflowScrollableText(
            value: transactionDataInfo.receiverAccountId,
            scrollShadowColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: transactionColor,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            "-${getAmount(transactionDataInfo.amount)} cc",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: onTransactionColor
            ),
          ),
        )
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initTransactions(context);
  }

  Future<void> initTransactions(BuildContext context) async {
    try {
      TransactionHistoryPageArguments arguments = ModalRoute.of(context)!.settings.arguments as TransactionHistoryPageArguments;

      final transactionsStream = await transactionService.getMyTransactions(arguments.accountId);

      setState(() {
        transactions = [];
      });
      transactionsStream.listen((transaction) {
        setState(() {
          transactions.add(transaction);
        });
      });
    } on GrpcError catch (e) {
      if (context.mounted) showNotificationMessage(context, "${e.message}", status: NotificationMessageStatus.error);
    } catch (e) {
      if (context.mounted) showNotificationMessage(context, "$e", status: NotificationMessageStatus.error);
    }
  }

  Future<void> rollbackTransaction(BuildContext context, String transactionId) async {
    try {
      await paymentService.rollback(transactionId);
      if (context.mounted) await initTransactions(context);
    } on GrpcError catch (e) {
      if (context.mounted) showNotificationMessage(context, "${e.message}", status: NotificationMessageStatus.error);
    } catch (e) {
      if (context.mounted) showNotificationMessage(context, "$e", status: NotificationMessageStatus.error);
    }
  }
}