import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:text_scroll/text_scroll.dart';

class OverflowScrollableText extends StatelessWidget {

  final String value;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? scrollShadowColor;
  final Velocity? velocity;

  const OverflowScrollableText({
    super.key,
    required this.value,
    this.textStyle,
    this.textAlign,
    this.scrollShadowColor,
    this.velocity
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var span = TextSpan(
        text: value,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      );

      var tp = TextPainter(
        maxLines: 1,
        textAlign: textAlign ?? TextAlign.left,
        textDirection: TextDirection.ltr,
        text: span,
      );

      tp.layout(maxWidth: size.maxWidth);

      var exceeded = tp.didExceedMaxLines;

      if (exceeded) {
        return ScrollShadow(
          size: 16,
          color: scrollShadowColor ?? Theme.of(context).colorScheme.background,
          child: TextScroll(
            value,
            mode: TextScrollMode.endless,
            velocity: velocity ?? const Velocity(pixelsPerSecond: Offset(20, 0)),
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
            intervalSpaces: 3,
          ),
        );
      } else {
        return Text(
          value,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.fade,
          textAlign: textAlign,
        );
      }
    });
  }
}