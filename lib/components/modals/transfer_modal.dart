import 'dart:developer';
import 'dart:ui';

import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pbgrpc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

enum TransferModalStatus {
  pending, success, rejected
}

class TransferModal extends StatefulWidget {

  final ValueNotifier<TransferModalStatus?> statusNotifier;
  final double transferAmount;
  final PublicAccountInfo receiverAccountInfo;
  final Function() onClose;
  final Function() onCancel;

  const TransferModal({
    super.key,
    required this.statusNotifier,
    required this.transferAmount,
    required this.receiverAccountInfo,
    required this.onClose,
    required this.onCancel
  });

  @override
  State<StatefulWidget> createState() => TransferModalState();
}

class TransferModalState extends State<TransferModal> with SingleTickerProviderStateMixin {

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

    return ValueListenableBuilder<TransferModalStatus?>(
      valueListenable: widget.statusNotifier,
      builder: (context, status, w) {

        Widget content = getWaitingContent(context);
        Widget button = getCancelButton(context);
        if (status != null) {
          switch (status) {
            case TransferModalStatus.pending:
              content = getPendingContent(context);
              button = getCancelButton(context);
              break;
            case TransferModalStatus.success:
              content = getSuccessContent(context);
              button = getCloseButton(context);
              break;
            case TransferModalStatus.rejected:
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
        Text("Rejected", style: Theme.of(context).textTheme.titleMedium,)
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
        Text("${widget.transferAmount.toString()} cc", style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        )),
        const SizedBox(height: 10),
        Text(
          widget.receiverAccountInfo.user.name,
          style: Theme.of(context).textTheme.labelLarge,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      ],
    );
  }
}

Future<void> showTransferModal(
    BuildContext context,
    ValueNotifier<TransferModalStatus?> statusNotifier,
    {
      required double transferAmount,
      required PublicAccountInfo receiverAccountInfo,
      required Function() onClose,
      required Function() onCancel,
    }
    ) async {
  await showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return TransferModal(
          statusNotifier: statusNotifier,
          transferAmount: transferAmount,
          receiverAccountInfo: receiverAccountInfo,
          onClose: onClose,
          onCancel: onCancel,
        );
      }
  );
}