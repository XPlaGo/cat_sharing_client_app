import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicons/unicons.dart' as unicons;

class CSTextInput extends StatefulWidget {

  final Function(String)? onComplete;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? placeholder;
  final Widget? prefixIcon;
  final bool autofocus;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? errorText;
  final bool showClearButton;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;

  const CSTextInput({
    super.key,
    this.onComplete,
    this.onChanged,
    this.prefixIcon,
    this.inputFormatters,
    this.placeholder,
    this.autofocus = false,
    this.keyboardType,
    this.initialValue,
    this.errorText,
    this.showClearButton = true,
    this.padding,
    this.obscureText = false,
  });

  @override
  State<StatefulWidget> createState() => CSTextInputState();
}

class CSTextInputState extends State<CSTextInput> {

  final _controller = TextEditingController();

  String textValue = "";

  @override
  void initState() {
    super.initState();

    textValue = widget.initialValue ?? "";
    _controller.text = textValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIcon: widget.showClearButton && textValue.isNotEmpty ? GestureDetector(
          onTap: clearValue,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              unicons.UniconsLine.multiply,
              size: 24,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
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
            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      style: Theme
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