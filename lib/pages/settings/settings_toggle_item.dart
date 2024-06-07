import 'package:flutter/material.dart';

class SettingsToggleItem extends StatefulWidget {

  final String itemName;
  final bool value;
  final Function(bool) setValue;

  const SettingsToggleItem({
    super.key,
    required this.itemName,
    required this.value,
    required this.setValue,
  });

  @override
  State<StatefulWidget> createState() => SettingsToggleItemState();
}

class SettingsToggleItemState extends State<SettingsToggleItem> {

  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.itemName),
        Switch(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
            widget.setValue(newValue);
          },
        )
      ],
    );
  }
}