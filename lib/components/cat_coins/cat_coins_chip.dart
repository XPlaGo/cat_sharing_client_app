import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:flutter/material.dart';

class CatCoinsChip extends StatefulWidget {

  final double value;

  const CatCoinsChip({super.key, required this.value});

  @override
  State<StatefulWidget> createState() => CatCoinsChipState();
}

class CatCoinsChipState extends State<CatCoinsChip> {
  @override
  Widget build(BuildContext context) {
    return CSAccentButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      onPressed: (reset) async {
      },
      borderRadius: BorderRadius.circular(20),
      text: "${formatCurrency(widget.value)}cc",
    );
  }

  String formatCurrency(double num) {
    if (num > 999.0 && num < 99999.0) {
      return "${(num / 1000.0).toStringAsFixed(1)} K";
    } else if (num > 99999.0 && num < 999999.0) {
      return "${(num / 1000.0).toStringAsFixed(0)} K";
    } else if (num > 999999.0 && num < 999999999.0) {
      return "${(num / 1000000.0).toStringAsFixed(1)} M";
    } else if (num > 999999999.0) {
      return "${(num / 1000000000.0).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }
}
