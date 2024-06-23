import 'dart:ui';

import 'package:flutter/material.dart';

Future<void> showDefaultBottomSheet(BuildContext context, Widget child) async {
  await showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.background.withOpacity(1),
      barrierColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
      elevation: 0,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: MediaQuery.of(context).padding.top,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background.withOpacity(1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    blurRadius: 16,
                  )],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 5,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(2.5)),
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: child,
                    )
                  ],
                ),
              )],
            ),
          ),
        );
      });
}
