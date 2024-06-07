import 'dart:ui';

import 'package:flutter/material.dart';

Future<void> showDefaultBottomSheet(BuildContext context, Widget child) async {
  await showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.background.withOpacity(0),
      elevation: 0,
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                  color:
                  Theme.of(context).colorScheme.background.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
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
                            color: Theme.of(context).textTheme.displaySmall?.color,
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: child,
                  )
                ],
              ),
            ),
          ),
        );
      });
}
