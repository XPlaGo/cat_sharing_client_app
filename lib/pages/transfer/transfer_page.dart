import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/cat_coins/cat_coins_card_icon.dart';
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

class TransferPageArguments {
  final AccountInfo senderAccountInfo;

  TransferPageArguments({required this.senderAccountInfo});
}

class TransferPage extends StatefulWidget {
  static String pageRoute = "/transfer";

  const TransferPage({super.key});

  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> with AfterLayoutMixin<TransferPage> {

  AccountInfo? accountInfo;
  PublicAccountInfo? receiverAccountInfo;

  PaymentAccountService paymentAccountService = GetIt.instance<PaymentAccountService>();
  PaymentService paymentService = GetIt.instance<PaymentService>();

  String transferAmount = "";
  String receiverEmailValue = "";

  ValueNotifier<TransferModalStatus?> transferStatusNotifier = ValueNotifier(null);

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
            isDisabled: !isAmountValid(transferAmount) || receiverAccountInfo == null,
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            overlayColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: (reset) async {
              await transfer(context);
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
      if (value > accountAmount) return false;
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
          child: Text("Transfer", style: Theme.of(context).textTheme.titleMedium)
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
                    "From account",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).textTheme.titleSmall?.color?.withOpacity(1)
                    )
                ),
              ),
              getSenderAccountSelector(context),
              const SizedBox(height: 15),
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                      "To account",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).textTheme.titleSmall?.color?.withOpacity(1)
                      )
                  ),
              ),
              getReceiverAccountSelector(context),
            ],
          ),
        )
      );
    };
  }

  Widget getSenderAccountSelector(BuildContext context) {
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

  Widget getReceiverAccountSelector(BuildContext context) {
    return Column(
      children: [
        Row(children: [Expanded(
          child: CSTextInput(
            placeholder: "Receiver email",
            onChanged: (value) async {
              setState(() {
                receiverEmailValue = value;
              });
              if (validateEmail(value)) {
                await getReceiverAccountInfo(context);
              } else {
                setState(() {
                  receiverAccountInfo = null;
                });
              }
            },
          ),
        )],),
        const SizedBox(height: 10),
        receiverAccountInfo == null ?
          const SizedBox() :
          getReceiverAccountItem(context)
      ],
    );
  }

  Widget getReceiverAccountItem(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CSFlatButton(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              onPressed: (reset) async {},
              backgroundColor: Theme.of(context).colorScheme.background,
              child: Row(
                children: [
                  const CatCoinsCardIcon(),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: OverflowScrollableText(
                        value: receiverAccountInfo?.id ?? "",
                        scrollShadowColor: Theme.of(context).colorScheme.background,
                      )
                  ),
                  const SizedBox(width: 15),
                  Iconify(
                    Uil.check,
                    size: 24,
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                ],
              ),
            )
        )
      ],
    );
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
    TransferPageArguments arguments = ModalRoute.of(context)!.settings.arguments as TransferPageArguments;
    AccountInfo accountInfo = arguments.senderAccountInfo;
    setState(() {
      this.accountInfo = accountInfo;
    });
  }

  Future<void> getReceiverAccountInfo(BuildContext context) async {
    PublicAccountInfo publicAccountInfo = await paymentAccountService.getPaymentAccountByEmail(receiverEmailValue);
    setState(() {
      receiverAccountInfo = publicAccountInfo;
    });
  }

  Future<void> transfer(BuildContext context) async {
    try {
      if (!context.mounted) return;

      double amount = double.parse(transferAmount);
      int units = amount.toInt();
      int nanos = amount - units == 0 ? 0 : int.parse(amount.toString().split(".")[1]);

      final stream = await paymentService.transfer(TransferRequest(
          senderAccountId: accountInfo?.id,
          receiverAccountId: receiverAccountInfo?.id,
          amount: Money(
              units: Int64(units),
              nanos: nanos
          )
      ));

      showTransferModal(
          context,
          transferStatusNotifier,
          transferAmount: double.parse(transferAmount),
          receiverAccountInfo: receiverAccountInfo!,
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
                transferStatusNotifier.value = TransferModalStatus.pending;
                break;
              case "SUCCESS":
                transferStatusNotifier.value = TransferModalStatus.success;
                break;
              case "REJECTED":
                transferStatusNotifier.value = TransferModalStatus.rejected;
                break;
            }
          });
        } on GrpcError catch (error) {
          if (error.code == Code.INVALID_ARGUMENT.value) {
            setState(() {
              transferStatusNotifier.value = TransferModalStatus.rejected;
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
          transferStatusNotifier.value = TransferModalStatus.rejected;
        });
      }
    } catch (e) {
      bool a = e.runtimeType == GrpcError.notFound("sdvs").runtimeType;
      print(e.runtimeType);
      print(a);
    }
  }
}