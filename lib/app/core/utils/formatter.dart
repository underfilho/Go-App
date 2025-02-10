import 'package:intl/intl.dart';

class CurrencyFormatter {
  final NumberFormat _formatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  String format(double value) {
    return _formatter.format(value);
  }
}
