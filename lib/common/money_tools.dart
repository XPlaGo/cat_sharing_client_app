import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fixnum/fixnum.dart';

class MoneyTools {
  static double convertToDouble(Money money) {
    return double.parse("${money.units}.${money.nanos}");
  }

  static String convertToString(Money money, {bool compact = false}) {
    CurrencyFormat catCoinsSettings = const CurrencyFormat(
      code: 'cc',
      symbol: 'cc',
      symbolSide: SymbolSide.right,
      thousandSeparator: ' ',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );

    double amount = convertToDouble(money);

    return CurrencyFormatter.format(amount, catCoinsSettings, compact: compact);
  }

  static Money fromString(String amountString) {
    double amount = double.parse(amountString);
    int units = amount.toInt();
    int nanos = amount - units == 0 ? 0 : int.parse(amount.toString().split(".")[1]);
    return Money(
      units: Int64(units),
      nanos: nanos,
    );
  }
}