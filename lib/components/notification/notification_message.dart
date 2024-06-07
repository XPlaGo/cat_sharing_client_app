import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

enum NotificationMessageStatus {
  plain,
  error,
  success,
}

class SnackbarMessage extends StatefulWidget {
  final String message;
  final NotificationMessageStatus status;

  const SnackbarMessage({
    super.key,
    required this.message,
    this.status = NotificationMessageStatus.plain,
  });

  @override
  State<StatefulWidget> createState() => NotificationMessageState();
}

class NotificationMessageState extends State<SnackbarMessage> {
  @override
  Widget build(BuildContext context) {

    Widget? icon;
    switch (widget.status) {
      case NotificationMessageStatus.plain:
        icon = null;
      case NotificationMessageStatus.error:
        icon = Iconify(
          Uil.exclamation_circle,
          size: 32,
          color: Theme.of(context).colorScheme.error,
        );
      case NotificationMessageStatus.success:
        icon = Iconify(
          Uil.check,
          size: 32,
          color: Theme.of(context).colorScheme.secondary,
        );
    }

    return Dismissible(
        onDismissed: (direction) {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner(reason: MaterialBannerClosedReason.swipe);
        },
        key: Key(widget.message),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset.zero,
              )]
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon == null ? const SizedBox() :
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: icon,
                    ),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}

Future<void> showNotificationMessage(
    BuildContext context,
    String message,
    {
      NotificationMessageStatus status = NotificationMessageStatus.plain,
      Duration duration = const Duration(seconds: 5),
    }) async {
  ScaffoldMessenger.of(context).removeCurrentMaterialBanner(reason: MaterialBannerClosedReason.remove);
  final controller = ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          dividerColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 20,
          margin: const EdgeInsets.only(
            right: 0,
            left: 10,
            bottom: 10,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          content: SnackbarMessage(
            message: message,
            status: status,
          ), actions: const [SizedBox()]));
  await Future.delayed(duration, () {
    controller.close();
  });
}
