import 'package:intl/intl.dart';

// final currencyFormat = new NumberFormat('#,##0.00', 'en_US');
String currencyFormat(String s) =>
    NumberFormat.decimalPattern('en').format(int.parse(s));