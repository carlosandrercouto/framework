import 'package:intl/intl.dart';

class Formatters {
  static String parseCurrency(double value) {
    final formatter = NumberFormat("###,##0.00", "pt-br").format(value);

    return "R\$ $formatter";
  }
}
