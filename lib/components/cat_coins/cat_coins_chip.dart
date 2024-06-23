import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';

class CatCoinsChip extends StatefulWidget {

  final String value;
  final Future<void> Function(Function())? onPressed;

  const CatCoinsChip({
    super.key,
    required this.value,
    this.onPressed
  });

  @override
  State<StatefulWidget> createState() => CatCoinsChipState();
}

class CatCoinsChipState extends State<CatCoinsChip> {
  @override
  Widget build(BuildContext context) {
    return CSAccentButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      onPressed: (reset) async {
        if (widget.onPressed != null) await widget.onPressed!(reset);
      },
      borderRadius: BorderRadius.circular(20),
      text: getAmount(),
    );
  }

  String getAmount() {

    CurrencyFormat catCoinsSettings = const CurrencyFormat(
      code: 'cc',
      symbol: 'cc',
      symbolSide: SymbolSide.right,
      thousandSeparator: ' ',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );

    return CurrencyFormatter.format(widget.value, catCoinsSettings, compact: true);
  }
}
