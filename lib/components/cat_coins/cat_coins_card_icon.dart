import 'package:flutter/material.dart';

class CatCoinsCardIcon extends StatelessWidget {
  const CatCoinsCardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          "CC",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
            fontWeight: FontWeight.w900
          ),
        ),
      )
    );
  }
}