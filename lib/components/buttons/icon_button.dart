import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CSIconButton extends StatefulWidget {
  final Future<void> Function(void Function()) onPressed;
  final String icon;
  final double iconSize;
  final Color? color;
  final Color? disabledColor;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? disabledBackgroundColor;
  final bool isLoading;
  final bool isDisabled;
  final List<BoxShadow>? shadow;
  final bool showLoader;

  const CSIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 32,
    this.color,
    this.disabledColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.overlayColor,
    this.isLoading = false,
    this.isDisabled = false,
    this.shadow,
    this.showLoader = true,
  });

  @override
  State<StatefulWidget> createState() => CSIconButtonState();
}

class CSIconButtonState extends State<CSIconButton> {

  bool isPressed = false;
  bool internalIsLoading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? 0.90 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: getFinalIsLoading() || widget.isDisabled ?
              (widget.disabledBackgroundColor ?? Theme.of(context).colorScheme.background)
                : (widget.backgroundColor ?? Theme.of(context).colorScheme.background),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: widget.shadow
          ),
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTapCancel: resetIsPress,
              child: InkWell(
                onTapDown: onTapDownHandler,
                onTapUp: onTapUpHandler,
                borderRadius: BorderRadius.circular(15.0),
                splashColor: widget.overlayColor ?? Theme.of(context).colorScheme.primaryContainer,
                splashFactory: InkSparkle.splashFactory,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: getContent(context),
                ),
              ),
            )
          )
      ),
    );
  }

  bool getFinalIsLoading() {
    return (widget.isLoading || internalIsLoading) && widget.showLoader;
  }

  Widget getContent(BuildContext context) {
    if (getFinalIsLoading()) {
      return SizedBox(
        height: widget.iconSize,
        width: widget.iconSize,
        child: SpinKitDualRing(
          color: widget.disabledColor ?? Theme.of(context).textTheme.bodyMedium?.color ?? const Color(0xFF000000),
          size: 14,
          lineWidth: 2,
        ),
      );
    } else {
      return Iconify(
        widget.icon,
        size: widget.iconSize,
        color: widget.isDisabled ? widget.disabledColor :
          widget.color ?? Theme.of(context).textTheme.bodyMedium?.color,
      );
    }
  }

  void onTapDownHandler(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void onTapUpHandler(TapUpDetails details) async {
    setState(() {
      isPressed = false;
    });

    if (!widget.isDisabled) {
      Future<void> result = widget.onPressed(() {
        setState(() {
          internalIsLoading = false;
        });
      });
      setState(() {
        internalIsLoading = true;
      });
      await result;
      setState(() {
        internalIsLoading = false;
      });
    }
  }

  void resetIsPress() {
    setState(() {
      isPressed = false;
    });
  }
}
