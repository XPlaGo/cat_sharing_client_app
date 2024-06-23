import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CSSkeleton extends StatelessWidget {

  final bool enabled;
  final Widget child;
  final Color? containersColor;

  const CSSkeleton({
    super.key,
    required this.child,
    required this.enabled,
    this.containersColor,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      containersColor: containersColor,
      enableSwitchAnimation: true,
      switchAnimationConfig: const SwitchAnimationConfig(
        duration: Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
      ),
      child: child,
    );
  }
}