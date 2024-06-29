import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/cat_coins/cat_coins_card_icon.dart';
import 'package:cat_sharing_client_app/components/modals/replenish_modal.dart';
import 'package:cat_sharing_client_app/components/modals/transfer_modal.dart';
import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pbgrpc.dart';
import 'package:cat_sharing_client_app/services/payment_account_service.dart';
import 'package:cat_sharing_client_app/services/payment_service.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class ReplenishPageArguments {
  final AccountInfo senderAccountInfo;

  ReplenishPageArguments({required this.senderAccountInfo});
}

class ReplenishPage extends StatefulWidget {
  static String pageRoute = "/replenish";

  const ReplenishPage({super.key});

  @override
  State<StatefulWidget> createState() => ReplenishPageState();
}

class ReplenishPageState extends State<ReplenishPage> with AfterLayoutMixin<ReplenishPage> {

  AccountInfo? accountInfo;

  PaymentAccountService paymentAccountService = GetIt.instance<PaymentAccountService>();
  PaymentService paymentService = GetIt.instance<PaymentService>();

  String transferAmount = "";

  ValueNotifier<ReplenishModalStatus?> transferStatusNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      floatingButton: getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget getFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CSTextInput(
              onChanged: (value) {
                setState(() {
                  transferAmount = value;
                });
              },
              inputFormatters: [CurrencyTextInputFormatter.currency(
                inputDirection: InputDirection.left,
                decimalDigits: 5,
                enableNegative: false,
              )],
              keyboardType: TextInputType.number,
              postfix: Text(
                "CC",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700
              ),
              showClearButton: false,
            ),
          ),
          const SizedBox(width: 5),
          CSIconButton(
            isDisabled: !isAmountValid(transferAmount),
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            overlayColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: (reset) async {
              await replenish(context);
            },
            icon: Uil.arrow_right,
            padding: const EdgeInsets.all(10),
            iconSize: 32,
          )
        ],
      ),
    );
  }

  bool isAmountValid(String amount) {
    try {
      double value = double.parse(amount);
      double accountAmount = double.parse("${accountInfo?.amount.units ?? 0}.${accountInfo?.amount.nanos ?? 0}");
      if (value <= 0) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (reset) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Replenish", style: Theme.of(context).textTheme.titleMedium)
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (reset) {
      return CSSkeleton(
        enabled: accountInfo == null,
        containersColor: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                    "To account",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).textTheme.titleSmall?.color?.withOpacity(1)
                    )
                ),
              ),
              getReplenishAccountSelector(context),
            ],
          ),
        )
      );
    };
  }

  Widget getReplenishAccountSelector(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CSFlatButton(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            onPressed: (reset) async {},
            child: Row(
              children: [
                const CatCoinsCardIcon(),
                const SizedBox(width: 16,),
                Expanded(
                  child: OverflowScrollableText(
                    value: accountInfo?.id ?? "",
                    scrollShadowColor: Theme.of(context).colorScheme.primaryContainer,
                  )
                ),
                const SizedBox(width: 16,),
                Text(
                  getAmount(accountInfo?.amount ?? Money(units: Int64(0), nanos: 0)),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }

  String getAmount(Money amount) {

    CurrencyFormat catCoinsSettings = const CurrencyFormat(
      code: 'cc',
      symbol: 'cc',
      symbolSide: SymbolSide.right,
      thousandSeparator: ' ',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );

    return CurrencyFormatter.format("${amount.units}.${amount.nanos}", catCoinsSettings);
  }

  bool validateEmail(String value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value.isNotEmpty && regex.hasMatch(value);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initMyAccount(context);
  }

  Future<void> initMyAccount(BuildContext context) async {
    ReplenishPageArguments arguments = ModalRoute.of(context)!.settings.arguments as ReplenishPageArguments;
    AccountInfo accountInfo = arguments.senderAccountInfo;
    setState(() {
      this.accountInfo = accountInfo;
    });
  }

  Future<void> replenish(BuildContext context) async {
    try {
      if (!context.mounted) return;

      double amount = double.parse(transferAmount);
      int units = amount.toInt();
      int nanos = amount - units == 0 ? 0 : int.parse(amount.toString().split(".")[1]);

      final stream = await paymentService.replenish(ReplenishRequest(
          receiverAccountId: accountInfo?.id,
          amount: Money(
              units: Int64(units),
              nanos: nanos
          ),
      ));

      showReplenishModal(
          context,
          transferStatusNotifier,
          transferAmount: double.parse(transferAmount),
          onClose: () {
            transferStatusNotifier.value = null;
            Navigator.of(context).pop();
          },
          onCancel: () {
            stream.cancel();
            transferStatusNotifier.value = null;
          }
      );

      stream.listen((element) {
        try {
          setState(() {
            switch (element.status) {
              case "PENDING":
                transferStatusNotifier.value = ReplenishModalStatus.pending;
                break;
              case "SUCCESS":
                transferStatusNotifier.value = ReplenishModalStatus.success;
                break;
              case "REJECTED":
                transferStatusNotifier.value = ReplenishModalStatus.rejected;
                break;
            }
          });
        } on GrpcError catch (error) {
          if (error.code == Code.INVALID_ARGUMENT.value) {
            setState(() {
              transferStatusNotifier.value = ReplenishModalStatus.rejected;
            });
          }
        } catch (e) {
          bool a = e.runtimeType == GrpcError.notFound("sdvs").runtimeType;
          print(e.runtimeType);
          print(a);
        }
      });
    } on GrpcError catch (error) {
      if (error.code == Code.INVALID_ARGUMENT.value) {
        setState(() {
          transferStatusNotifier.value = ReplenishModalStatus.rejected;
        });
      }
    } catch (e) {
      bool a = e.runtimeType == GrpcError.notFound("sdvs").runtimeType;
      print(e.runtimeType);
      print(a);
    }
  }
}