import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicons/unicons.dart' as unicons;

class CSTextInput extends StatefulWidget {

  final Function(String)? onComplete;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? placeholder;
  final Widget? prefixIcon;
  final Widget? postfix;
  final bool autofocus;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? errorText;
  final bool showClearButton;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool expands;

  const CSTextInput({
    super.key,
    this.onComplete,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.postfix,
    this.inputFormatters,
    this.placeholder,
    this.autofocus = false,
    this.keyboardType,
    this.initialValue,
    this.errorText,
    this.showClearButton = true,
    this.padding,
    this.obscureText = false,
    this.textStyle,
    this.maxLines,
    this.expands = false,
  });

  @override
  State<StatefulWidget> createState() => CSTextInputState();
}

class CSTextInputState extends State<CSTextInput> {

  late final _controller;

  String textValue = "";

  @override
  void initState() {
    super.initState();

    textValue = widget.initialValue ?? "";
    _controller = widget.controller ?? TextEditingController();
    _controller.text = textValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: widget.expands,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      autofocus: widget.autofocus,
      controller: _controller,
      keyboardType: widget.keyboardType,
      onEditingComplete: () {
        if (widget.onComplete != null) widget.onComplete!(textValue);
      },
      onChanged: (value) {
        setState(() {
          textValue = value;
        });
        if (widget.onChanged != null) widget.onChanged!(textValue);
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: widget.prefixIcon != null ? Padding(
          padding: const EdgeInsets.all(15),
          child: widget.prefixIcon,
        ) : null,
        errorText: widget.errorText,
        suffixIcon: (widget.showClearButton && textValue.isNotEmpty) || widget.postfix != null ? GestureDetector(
          onTap: clearValue,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.postfix != null ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: widget.postfix,
              ) : const SizedBox(),
              widget.showClearButton && textValue.isNotEmpty ? Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  unicons.UniconsLine.multiply,
                  size: 24,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ) : const SizedBox(),
            ],
          )
        ) : null,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primaryContainer,
              width: 2,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primaryContainer,
              width: 2,
            )
        ),
        labelText: widget.placeholder,
        labelStyle: Theme
            .of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(
          color: const Color.fromRGBO(127, 127, 127, 1),
        ),
        contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: Theme
            .of(context)
            .colorScheme
            .primaryContainer,
        alignLabelWithHint: true,
      ),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      style: widget.textStyle ?? Theme
          .of(context)
          .textTheme
          .bodyMedium,
    );
  }

  void clearValue() {
    setState(() {
      textValue = "";
    });
    _controller.clear();
    if (widget.onChanged != null) widget.onChanged!("");
  }
}