import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/rates.dart';

class CurrencyConversion {
  final double amount;
  final String base;
  final String date;
  final Rates rates;

  CurrencyConversion({this.amount, this.base, this.date, this.rates});
}
