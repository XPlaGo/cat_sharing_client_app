import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CSFlatButton extends StatefulWidget {

  final Future<void> Function(void Function()) onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? disabledBackgroundColor;
  final Color? color;
  final Color? disabledColor;
  final BorderRadius? borderRadius;
  final double loaderSize;
  final bool isLoading;
  final bool isDisabled;
  final List<BoxShadow>? shadow;
  final Widget? prefixIcon;
  final bool showLoader;

  const CSFlatButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.padding,
    this.backgroundColor,
    this.overlayColor,
    this.disabledBackgroundColor,
    this.loaderSize = 32,
    this.isLoading = false,
    this.isDisabled = false,
    this.color,
    this.disabledColor,
    this.borderRadius,
    this.shadow,
    this.prefixIcon,
    this.textStyle,
    this.showLoader = true,
  });

  @override
  State<StatefulWidget> createState() => CSFlatButtonState();
}

class CSFlatButtonState extends State<CSFlatButton> {

  bool isPressed = false;
  bool internalIsLoading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? 0.90 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: getFinalIsLoading() || widget.isDisabled ?
              (widget.disabledBackgroundColor ?? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5))
                  : (widget.backgroundColor ?? Theme.of(context).colorScheme.primaryContainer),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15.0),
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
                splashColor: widget.overlayColor ?? Theme.of(context).colorScheme.shadow,
                splashFactory: InkSparkle.splashFactory,
                child: Padding(
                  padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
        height: widget.loaderSize,
        width: widget.loaderSize,
        child: SpinKitDualRing(
          color: widget.disabledColor ?? Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5) ?? const Color(0xFF000000),
          size: 14,
          lineWidth: 2,
        ),
      );
    } else {
      return widget.child ?? (widget.text != null ? getTextContent(context) : const SizedBox());
    }
  }

  Widget getTextContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.prefixIcon != null ?
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: widget.prefixIcon,
        ) : const SizedBox(),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(widget.isDisabled ? 0.5 : 0),
          ),
        )
      ],
    );
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