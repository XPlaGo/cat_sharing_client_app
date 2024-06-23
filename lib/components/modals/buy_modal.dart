import 'dart:ui';

import 'package:cat_sharing_client_app/common/money_tools.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

enum BuyModalStatus {
  pending, confirmed, rejected
}

class BuyModal extends StatefulWidget {

  final ValueNotifier<BuyModalStatus?> statusNotifier;
  final ValueNotifier<String?> rejectionReason;
  final SaleOfferFullInfo saleOfferFullInfo;
  final Function() onClose;
  final Function() onCancel;

  const BuyModal({
    super.key,
    required this.statusNotifier,
    required this.rejectionReason,
    required this.saleOfferFullInfo,
    required this.onClose,
    required this.onCancel,
  });

  @override
  State<StatefulWidget> createState() => BuyModalState();
}

class BuyModalState extends State<BuyModal> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<BuyModalStatus?>(
      valueListenable: widget.statusNotifier,
      builder: (context, status, w) {

        Widget content = getWaitingContent(context);
        Widget button = getCancelButton(context);
        if (status != null) {
          switch (status) {
            case BuyModalStatus.pending:
              content = getPendingContent(context);
              button = getCancelButton(context);
              break;
            case BuyModalStatus.confirmed:
              content = getSuccessContent(context);
              button = getCloseButton(context);
              break;
            case BuyModalStatus.rejected:
              content = getRejectedContent(context);
              button = getCloseButton(context);
              break;
          }
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        content
                                      ],
                                    )
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    button,
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  Widget getCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CSFlatButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: (reset) async {
                widget.onClose();
                Navigator.of(context).pop(context);
              },
              text: "Done",
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CSFlatButton(
              onPressed: (reset) async {
                widget.onCancel();
                Navigator.of(context).pop(context);
              },
              text: "Cancel",
            ),
          )
        ],
      ),
    );
  }

  Widget getWaitingContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitDualRing(
          color: Theme.of(context).textTheme.bodyMedium?.color ?? const Color(0xFF000000),
          size: 48,
          lineWidth: 2,
        ),
        const SizedBox(height: 10),
        Text("Waiting", style: Theme.of(context).textTheme.titleMedium,)
      ],
    );
  }

  Widget getPendingContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitDualRing(
          color: Theme.of(context).textTheme.bodyMedium?.color ?? const Color(0xFF000000),
          size: 48,
          lineWidth: 2,
        ),
        const SizedBox(height: 10),
        Text("Pending", style: Theme.of(context).textTheme.titleMedium,)
      ],
    );
  }

  Widget getRejectedContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Iconify(
          Uil.multiply,
          size: 48,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 10),
        Text("Rejected", style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          widget.rejectionReason.value ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.fade,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget getSuccessContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Iconify(
          Uil.check,
          size: 48,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 128,
            width: 128,
            child: Image(
                image: AssetImage(
                    "assets/avatar/${widget.saleOfferFullInfo.cat.avatarId}.png"))),
        const SizedBox(height: 10),
        Text(
          widget.saleOfferFullInfo.cat.name,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
        const SizedBox(height: 10),
        Text(
          MoneyTools.convertToString(widget.saleOfferFullInfo.price),
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      ],
    );
  }
}

Future<void> showBuyModal(
    BuildContext context,
    ValueNotifier<BuyModalStatus?> statusNotifier,
    ValueNotifier<String?> rejectionReason,
    {
      required SaleOfferFullInfo saleOfferFullInfo,
      required Function() onClose,
      required Function() onCancel,
    }
    ) async {
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BuyModal(
          statusNotifier: statusNotifier,
          rejectionReason: rejectionReason,
          saleOfferFullInfo: saleOfferFullInfo,
          onClose: onClose,
          onCancel: onCancel,
        );
      }
  );
}