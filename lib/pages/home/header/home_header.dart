import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/cat_coins/cat_coins_chip.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/services/payment_account_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/icons/uil.dart';

class HomeHeader extends StatefulWidget {

  final bool isDrawerOpened;
  final Function(bool) setDrawerState;

  const HomeHeader({
    super.key,
    required this.setDrawerState,
    required this.isDrawerOpened
  });

  @override
  State<StatefulWidget> createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> with AfterLayoutMixin<HomeHeader> {

  AccountInfo? accountInfo;

  PaymentAccountService paymentAccountService = GetIt.instance<PaymentAccountService>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CSIconButton(
              onPressed: (reset) async {
                widget.setDrawerState(!widget.isDrawerOpened);
              },
              icon: widget.isDrawerOpened ? Uil.multiply : Uil.bars,
            ),
            CSSkeleton(
              containersColor: Theme.of(context).colorScheme.primaryContainer,
              enabled: accountInfo == null,
              child: CatCoinsChip(
                onPressed: (reset) async {
                  Navigator.of(context).pushNamed("/my_payment_account").then((value) {
                    reset();
                    getMyPaymentAccount(context);
                  });
                },
                  value: "${accountInfo?.amount.units ?? 0}.${accountInfo?.amount.nanos ?? 0}"
              ),
            )
          ]
      ),
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